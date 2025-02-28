//
//  File.swift
//  
//
//  Created by Bas Jansen on 16/09/2023.
//

import Foundation
import UIKit

class ToastHelper {
    
    public static func topController() -> UIViewController? {
    var topController: UIViewController?

    if #available(iOS 13.0, *) {
        topController = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?.rootViewController
    } else {
        topController = UIApplication.shared.keyWindow?.rootViewController
    }

    while let presented = topController?.presentedViewController {
        topController = presented
    }

    return topController
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
