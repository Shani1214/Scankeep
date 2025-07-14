//
//  ReceiptModel.swift
//  ScanKeep
//
//  Created by MacMini on 05/06/2025.
//

import Foundation

struct ReceiptModel: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let amount: String
}


