//
//  NoteResponse.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import Foundation

struct NoteResponse: Codable {
    
    var invites: NoteInvites?
    var likes: NoteLikes?
    
}

// MARK: Note Invites
struct NoteInvites: Codable {
    
    var profiles: [NoteInvitesProfile]?
    var totalPages: Int?
    var pendingInvitationsCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case profiles, totalPages, pendingInvitationsCount = "pending_invitations_count"
    }
    
}

struct NoteInvitesProfile: Codable {
    
    var generalInformation: GeneralInformation?
    var approvedTime: Double?
    var disapprovedTime: Double?
    var photos: [Photos]?
    var userInterests: [String]?
    var work: Work?
    var preferences: [Preferences]?
    var instagramImages: String?
    var lastSeenWindow: String?
    var isFacebookDataFetched: Bool?
    var icebreakers: String?
    var story: String?
    var meetup: String?
    var verificationStatus: String?
    var hasActiveSubscription: Bool?
    var showConciergeBadge: Bool?
    var lat: Double?
    var lng: Double?
    var lastSeen: String?
    var onlineCode: Int?
    var profileDataList: [ProfileData]?
    
    private enum CodingKeys: String, CodingKey {
        case generalInformation = "general_information"
        case approvedTime = "approved_time"
        case disapprovedTime = "disapproved_time"
        case photos
        case userInterests = "user_interests"
        case work
        case preferences
        case instagramImages = "instagram_images"
        case lastSeenWindow = "last_seen_window"
        case isFacebookDataFetched = "is_facebook_data_fetched"
        case icebreakers
        case story
        case meetup
        case verificationStatus = "verification_status"
        case hasActiveSubscription = "has_active_subscription"
        case showConciergeBadge = "show_concierge_badge"
        case lat
        case lng
        case lastSeen = "last_seen"
        case onlineCode = "online_code"
        case profileDataList = "profile_data_list"
    }
    
}

// MARK: Note Invites - General Info
struct GeneralInformation: Codable {
    
    var dob: String?
    var dobV1: String?
    var location: GeneralInfoLocation?
    var drink: GeneralInfoDrink
    var fName: String?
    var gender: String?
    var maritalStatus: GeneralInfoMaritalStatus?
    var refId: String?
    var smoking: GeneralInfoSmoking?
    var sunSign: GeneralInfoSunSign?
    var motherTongue: GeneratlInfoMotherTongue?
    var faith: GeneralInfoFaith?
    var height: Int?
    var cast: String?
    var kid: String?
    var diet: String?
    var politics: String?
    var pet: String?
    var settle: String?
    var mbti: String?
    var age: Int?
    
    private enum CodingKeys: String, CodingKey {
        case dob = "date_of_birth"
        case dobV1 = "date_of_birth_v1"
        case location
        case drink = "drinking_v1"
        case fName = "first_name"
        case gender
        case maritalStatus = "marital_status_v1"
        case refId = "ref_id"
        case smoking = "smoking_v1"
        case sunSign = "sun_sign_v1"
        case motherTongue = "mother_tongue"
        case faith
        case height
        case cast
        case kid
        case diet
        case politics
        case pet
        case settle
        case mbti
        case age
    }
    
}

struct GeneralInfoLocation: Codable {
    var summary: String?
    var full: String?
}

struct GeneralInfoDrink: Codable {
    var id: Int?
    var name: String?
    var name_alias: String?
}

struct GeneralInfoMaritalStatus: Codable {
    var id: Int?
    var name: String?
    var preference_only: Bool?
}

struct GeneralInfoSmoking: Codable {
    var id: Int?
    var name: String?
    var name_alias: String?
}

struct GeneralInfoSunSign: Codable {
    var id: Int?
    var name: String?
}

struct GeneratlInfoMotherTongue: Codable {
    var id: Int?
    var name: String?
}

struct GeneralInfoFaith: Codable {
    var id: Int?
    var name: String?
}

// MARK: Note Invites - Photos
struct Photos: Codable {
    
    var photo: String?
    var photoId: Int?
    var selected: Bool?
    var status: String?
    
    private enum CodingKeys: String, CodingKey {
        case photo, photoId = "photo_id", selected, status
    }
    
}

// MARK: Note Invites - Work
struct Work: Codable {
    
    var industry: WorkIndustry?
    var monthlyIncome: String?
    var experience: WorkExperience?
    var highestQualification: WorkQualification?
    var fieldOfStudy: WorkFieldOfStudy?
    
    private enum CodingKeys: String, CodingKey {
        case industry = "industry_v1"
        case monthlyIncome = "monthly_income_v1"
        case experience = "experience_v1"
        case highestQualification = "highest_qualification_v1"
        case fieldOfStudy = "field_of_study_v1"
    }
    
}

struct WorkIndustry: Codable {
    
    var id: Int?
    var name: String?
    var preferenceOnly: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, preferenceOnly = "preference_only"
    }
    
}

struct WorkExperience: Codable {
    
    var id: Int?
    var name: String?
    var nameAlias: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, nameAlias = "name_alias"
    }
    
}

struct WorkQualification: Codable {
    
    var id: Int?
    var name: String?
    var preferenceOnly: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, preferenceOnly = "preference_only"
    }
    
}

struct WorkFieldOfStudy: Codable {
    
    var id: Int?
    var name: String?
    
}

// MARK: Note Invites - Preferences
struct Preferences: Codable {
    
    var answerId: Int?
    var id: Int?
    var value: Int?
    var preferenceQuestion: PrefereneceQuestion?
    
    private enum CodingKeys: String, CodingKey {
        case answerId = "answer_id", id, value, preferenceQuestion = "preference_question"
    }
    
}

struct PrefereneceQuestion: Codable {
    
    var firstChoice: String?
    var secondChoice: String?
    
    private enum CodingKeys: String, CodingKey {
        case firstChoice = "first_choice", secondChoice = "second_choice"
    }
    
}

// MARK: Note Invites - Profile Data
struct ProfileData: Codable {
    
    var question: String?
    var preferences: [ProfileDataPreferences]?
    var invitationType: String?
    
    private enum CodingKeys: String, CodingKey {
        case question, preferences, invitationType = "invitation_type"
    }
    
}

struct ProfileDataPreferences: Codable {
    
    var answerId: Int?
    var answer: String?
    var firstChoice: String?
    var secondChoice: String?
    
    private enum CodingKeys: String, CodingKey {
        case answerId = "answer_id"
        case answer
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
    
}


// MARK: Note Likes
struct NoteLikes: Codable {
    
    var profiles: [NoteLikesProfile]?
    var canSeeProfile: Bool?
    var likesReceivedCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case profiles, canSeeProfile = "can_see_profile", likesReceivedCount = "likes_received_count"
    }
    
}

struct NoteLikesProfile: Codable {
    
    var firstName: String?
    var avatar: String?
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name", avatar
    }
    
}
