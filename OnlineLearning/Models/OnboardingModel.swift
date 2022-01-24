//
//  OnboardingModel.swift
//  OnlineLearning
//
//  Created by vinatti on 24/01/2022.
//

import Foundation

struct OnboardingModel: Codable {
    var image: String?
    var title: String?
    var description: String?
}

let OnboardingData: [OnboardingModel] = [
    OnboardingModel(image: "onboarding_first", title: "Numerous free trial courses", description: "Free courses for you to find your way to learning"),
    OnboardingModel(image: "onboarding_second", title: "Quick and easy learning", description: "Easy and fast learning at any time to help you improve various skills"),
    OnboardingModel(image: "onboarding_third", title: "Create your own study plan", description: "Study according to the study plan, make study more motivated")
]
