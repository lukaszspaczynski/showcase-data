//
//  MockedEndpoints.swift
//  ShowcaseMocks
//
//  Created by Lukasz Spaczynski on 20/11/2021.
//

#if canImport(UIKit)

import ShowcaseData
import Foundation

public struct MockedEndpoints:
    BioWebEndpoint
{
    private static let dummyURL = URL(string: "https://dummy.dev/")!

    public init() {}

    public var bioEndpoint: URL {
        MockedEndpoints.dummyURL
    }
}

#endif
