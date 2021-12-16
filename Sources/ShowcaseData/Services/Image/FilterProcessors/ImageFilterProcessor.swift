//
//  ImageFilterProcessor.swift
//  ShowcaseData
//
//  Created by Lukasz Spaczynski on 02/12/2021.
//

#if canImport(UIKit)

import CoreImage

public enum ImageFilterProcessorError: Error {
    case noReferenceFilter(String)
    case filterFailure(String)
}

public protocol ImageFilterProcessor {
    func process(_ image: inout CIImage) throws
}

#endif
