//
//  ConcreteRichTextTemplatesLocalDataSource.swift
//  ShowcaseData
//
//  Created by Lukasz Spaczynski on 24/11/2021.
//

#if canImport(UIKit)

import RxSwift
import Foundation
import ShowcaseExtensions

public final class ConcreteRichTextTemplatesLocalDataSource: RichTextTemplatesLocalDataSource {
    public enum DataSourceError: Error {
        case resourceNotFound
        case underlyingError(Error)
    }

    public init() {}

    public func getTemplate(_ name: RichTextTemplate.Name) -> Observable<Result<RichTextTemplate, Error>> {
        .just(Result<RichTextTemplate, Error> {
            let fileName = name.description + "-template"
            let ext = "rtf"

            guard let url = Bundle.module.url(forResource: fileName, withExtension: ext) else {
                throw DataSourceError.resourceNotFound
            }

            do {
                return try RichTextTemplate(name: name, url: url)
            } catch {
                throw DataSourceError.underlyingError(error)
            }
        })
    }
}

#endif
