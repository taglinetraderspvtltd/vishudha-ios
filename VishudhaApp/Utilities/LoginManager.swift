//
//  LoginManager.swift
//  VishudhaApp
//
//  Created by Vishudha Tagline Traders on 18/05/24.
//

import Foundation

import SwiftUI

class LoginManager: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
}
