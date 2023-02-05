//
//  TCA_PracticeApp.swift
//  TCA-Practice
//
//  Created by Jacob Ko on 2023/02/05.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_PracticeApp: App {
	
	// MARK: - STORE 생성
	// 최상위 App 레벨에서 Store 생성
	// 초기 State 값 설정
	let counterStore = Store(initialState: CounterState(), reducer: counterReduce)
	
    var body: some Scene {
        WindowGroup {
            CounterView(store: counterStore)
        }
    }
}
