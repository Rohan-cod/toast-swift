//
//  File.swift
//  
//
//  Created by Bas Jansen on 16/09/2023.
//

import Foundation
import UIKit

class ToastHelper {
    
    static var toastWindow: UIWindow?
    
    public static func topController() -> UIViewController? {
        return toastWindow?.rootViewController ?? UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController
    }

    private static func keyWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            for scene in UIApplication.shared.connectedScenes {
                guard let windowScene = scene as? UIWindowScene else {
                    continue
                }
                if windowScene.windows.isEmpty {
                    continue
                }
                guard let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                    continue
                }
                return window
            }
            return nil
        } else {
            return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        }
    }
    
}
