//
//  KakaoMapVCWrapper.swift
//  Fishome
//
//  Created by 조성빈 on 3/7/24.
//

import Foundation
import SwiftUI

//UIViewControllerRepresentable -> SwiftUI에 뷰 컨트롤러(UIKit)를 가져옴
struct KakaoMapVCWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return KakaoMapVC()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}


class KakaoMapVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = MTMapView(frame: self.view.frame)
        mapView.baseMapType = .hybrid
        
        self.view.addSubview(mapView)
        
    }
}
