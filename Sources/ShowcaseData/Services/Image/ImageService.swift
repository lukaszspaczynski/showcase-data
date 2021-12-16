//
//  ImageService.swift
//  ShowcaseData
//
//  Created by Lukasz Spaczynski on 01/12/2021.
//

#if canImport(UIKit)

import RxSwift
import UIKit

public protocol ImageService {
    func getRemoteImage(_ url: URL) -> Observable<Result<UIImage, Error>>
}

#endif
