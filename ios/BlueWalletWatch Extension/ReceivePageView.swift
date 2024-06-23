//
//  ReceivePageViewController.swift
//  BlueWalletWatch Extension
//
//  Created by Marcos Rodriguez on 6/15/24.
//  Copyright © 2024 BlueWallet. All rights reserved.
//
import SwiftUI

struct ReceivePageView: View {
    var wallet: Wallet
    var pageNames = ["Address", "Payment Code"]
    var pageControllers = ["ReceiveInterfaceController", "ReceiveInterfaceController"]

    var body: some View {
        TabView {
            ForEach(0..<pageNames.count, id: \.self) { index in
                if index == 0 {
                    ReceiveAddressView(wallet: wallet)
                } else {
                  ReceiveAddressView(wallet: wallet, receiveMethod: .CreateInvoice)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ReceivePageView_Previews: PreviewProvider {
    static var previews: some View {
        let mockWallet = Wallet(
            id: UUID(),
            label: "Sample Wallet",
            balance: "$1000",
            type: WalletType.SegwitNative,
            preferredBalanceUnit: "BTC",
            receiveAddress: "address", 
            xpub: "123",
            hideBalance: false,
            paymentCode: nil
        )
        return ReceivePageView(wallet: mockWallet)
    }
}

