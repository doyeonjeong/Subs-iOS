//
//  UIFont+Extension.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/10/24.
//

import UIKit

extension UIFont {
    static func pretendard(type: PretendardType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.name, size: size) else {
            return UIFont()// 기본으로 설정해주기
        }
        return font
    }
    
    public enum PretendardType {
        case Black
        case Bold
        case ExtraBold
        case ExtraLight
        case Light
        case Medium
        case Regular
        case SemiBold
        case Thin
        
        var name: String {
            switch self {
            case .Black:
                return "Pretendard-Black"
            case .Bold:
                return "Pretendard-Bold"
            case .ExtraBold:
                return "Pretendard-ExtraBold"
            case .ExtraLight:
                return "Pretendard-ExtraLight"
            case .Light:
                return "Pretendard-Light"
            case .Medium:
                return "Pretendard-Medium"
            case .Regular:
                return "Pretendard-Regular"
            case .SemiBold:
                return "Pretendard-SemiBold"
            case .Thin:
                return "Pretendard-Thin"
            }
        }
    }
}
