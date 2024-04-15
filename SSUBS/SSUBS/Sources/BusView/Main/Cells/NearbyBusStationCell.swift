//
//  NearbyBusStationCell.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import UIKit

struct BusStation2 {
    let title: String
    let direction: String
}

class NearbyBusStationCell: UITableViewCell {
    
    static let identifier = String(describing: NearbyBusStationCell.self)
    
    var buses: [BusStation2]? {
        didSet {
            pageControl.numberOfPages = buses?.count ?? 0
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: - Setup Methods
extension NearbyBusStationCell {
    private func setup() {
        contentView.backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(BusStationCarouselCell.self, forCellWithReuseIdentifier: BusStationCarouselCell.identifier)
        
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(pageControl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func config(_ stations: [BusStation2]?) {
        guard let stations else { return }
        buses = stations
        
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension NearbyBusStationCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buses?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BusStationCarouselCell.identifier, for: indexPath) as? BusStationCarouselCell,
            let buses = buses
        else { return BusStationCarouselCell() }
        cell.configure(with: buses[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension NearbyBusStationCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let collectionViewWidth = collectionView.frame.width
        let itemWidth = collectionViewWidth - 64 // 이전에 정의된 셀의 너비
        let spacing = CGFloat(10)
        
        let currentPage = Int((offsetX + spacing * 0.5 + itemWidth / 2) / (itemWidth + spacing))
        pageControl.currentPage = max(0, min(pageControl.numberOfPages - 1, currentPage))
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension NearbyBusStationCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width - 64
        let itemHeight = collectionView.frame.height - 8
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
