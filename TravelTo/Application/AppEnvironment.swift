//
//  AppEnvironment.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

final class AppEnvironment: ObservableObject {
    @Published var isLoggedIn: Bool = false
//    let objectWillChange = PassthroughSubject<Void, Never>()

    let apiClient = APIClient()
    lazy var baseURL = URL(string: "http://localhost:8080/")!

    // MARK: - Repositories
    lazy var articleRepository: ArticleRepositoryProtocol = {
        ArticleRepositoryImpl(apiClient: apiClient, baseURL: baseURL)
    }()
    lazy var attractionRepository: AttractionRepositoryProtocol = {
        AttractionRepositoryImpl(apiClient: apiClient, baseURL: baseURL)
    }()
    lazy var discussionRepository: DiscussionRepositoryProtocol = {
        DiscussionRepositoryImpl(apiClient: apiClient, baseURL: baseURL)
    }()
    lazy var facilityRepository: FacilityRepositoryProtocol = {
        FacilityRepositoryImpl(apiClient: apiClient, baseURL: baseURL)
    }()
    lazy var posterRepository: PosterRepositoryProtocol = {
        PosterRepositoryImpl(apiClient: apiClient, baseURL: baseURL)
    }()
    lazy var userRepository: UserRepositoryProtocol = {
        UserRepositoryImpl(apiClient: apiClient, baseURL: baseURL)
    }()

    // MARK: - Article UseCases
    private func makeFetchArticlesUseCase() -> FetchArticlesUseCase {
        FetchArticlesUseCase(repository: articleRepository)
    }
    private func makeFetchArticleByTitleUseCase() -> FetchArticleByTitleUseCase {
        FetchArticleByTitleUseCase(repository: articleRepository)
    }
    private func makeFetchArticleMyUseCase() -> FetchArticleMyUseCase {
        FetchArticleMyUseCase(repository: articleRepository)
    }
    private func makeCreateArticleUseCase() -> CreateArticleUseCase {
        CreateArticleUseCase(repository: articleRepository)
    }
    private func makeDeleteArticleUseCase() -> DeleteArticleUseCase {
        DeleteArticleUseCase(repository: articleRepository)
    }

    // MARK: - Attraction UseCases
    private func makeFetchAttractionsUseCase() -> FetchAttractionsUseCase {
        FetchAttractionsUseCase(repository: attractionRepository)
    }
    private func makeFetchAttractionUseCase() -> FetchAttractionUseCase {
        FetchAttractionUseCase(repository: attractionRepository)
    }
    private func makeCreateAttractionUseCase() -> CreateAttractionUseCase {
        CreateAttractionUseCase(repository: attractionRepository)
    }
    private func makeDeleteAttractionUseCase() -> DeleteAttractionUseCase {
        DeleteAttractionUseCase(repository: attractionRepository)
    }
    private func makeEditAttractionUseCase() -> EditAttractionUseCase {
        EditAttractionUseCase(repository: attractionRepository)
    }
    private func makeFetchMyAttractionsUseCase() -> FetchMyAttractionUseCase {
        FetchMyAttractionUseCase(repository: attractionRepository)
    }
    private func makeSearchAttractionByNameUseCase() -> SearchAttractionByNameUseCase {
        SearchAttractionByNameUseCase(repository: attractionRepository)
    }
    private func makeSearchAttractionByTypeAndNameUseCase() -> SearchAttractionByTypeAndNameUseCase {
        SearchAttractionByTypeAndNameUseCase(repository: attractionRepository)
    }
    private func makeSearchAttractionByTypeAndAddressUseCase() -> SearchAttractionByTypeAndAddressUseCase {
        SearchAttractionByTypeAndAddressUseCase(repository: attractionRepository)
    }

    // MARK: - Discussion UseCases
    private func makeFetchDiscussionsUseCase() -> FetchDiscussionUseCasep {
        FetchDiscussionUseCasep(repository: discussionRepository)
    }
    private func makeCreateDiscussionUseCase() -> CreateDiscussionUseCasep {
        CreateDiscussionUseCasep(repository: discussionRepository)
    }
    private func makeDeleteDiscussionUseCase() -> DeleteDiscussionUseCasep {
        DeleteDiscussionUseCasep(repository: discussionRepository)
    }

    // MARK: - Facility UseCases
    private func makeFetchFacilitiesUseCase() -> FetchFacilitiesUseCase {
        FetchFacilitiesUseCase(repository: facilityRepository)
    }
    private func makeCreateFacilityUseCase() -> CreateFacilityUseCase {
        CreateFacilityUseCase(repository: facilityRepository)
    }

    // MARK: - Poster UseCases
    private func makeFetchPostersUseCase() -> FetchPostersUseCase {
        FetchPostersUseCase(repository: posterRepository)
    }
    private func makeCreatePosterUseCase() -> CreatePosterUseCase {
        CreatePosterUseCase(repository: posterRepository)
    }

    // MARK: - User UseCases
    private func makeSignInUseCase() -> SignInUseCase {
        SignInUseCase(repository: userRepository)
    }
    private func makeSignUpFirstStepUseCase() -> SignUpFirstStepUseCase {
        SignUpFirstStepUseCase(repository: userRepository)
    }
    private func makeSignUpSecondStepUseCase() -> SignUpSecondStepUseCase {
        SignUpSecondStepUseCase(repository: userRepository)
    }
    private func makeResetPasswordUseCase() -> ResetPasswordUseCase {
        ResetPasswordUseCase(repository: userRepository)
    }
    private func makeFetchCurrentUserUseCase() -> FetchCurrentUserUseCase {
        FetchCurrentUserUseCase(repository: userRepository)
    }
    private func makeDeleteCurrentUserUseCase() -> DeleteCurrentUserUseCase {
        DeleteCurrentUserUseCase(repository: userRepository)
    }
    private func makeSaveProfileChangesUseCase() -> SaveProfileChangesUseCase {
        SaveProfileChangesUseCase(repository: userRepository)
    }

    // MARK: - Article ViewModels
    func makeArticlesListViewModel() -> ArticlesListViewModel {
        ArticlesListViewModel(fetchUseCase: makeFetchArticlesUseCase())
    }
    func makeArticleViewModel() -> ArticleViewModel {
        ArticleViewModel(fetchUseCase: makeFetchArticleByTitleUseCase())
    }
    func makeArticleCreateViewModel() -> ArticleCreateViewModel {
        ArticleCreateViewModel(fetchUseCase: makeCreateArticleUseCase())
    }
    func makeArticleDeleteViewModel() -> ArticleDeleteViewModel {
        ArticleDeleteViewModel(fetchUseCase: makeDeleteArticleUseCase())
    }
    func makeArticlesMyViewModel() -> ArticleMyViewModel {
        ArticleMyViewModel(fetchUseCase: makeFetchArticleMyUseCase())
    }

    // MARK: - Attraction ViewModels
    func makeAttractionsFetchViewModel() -> AttractionsFetchViewModel {
        AttractionsFetchViewModel(fetchUseCase: makeFetchAttractionsUseCase())
    }
    func makeAttractionFetchViewModel() -> AttractionFetchViewModel {
        AttractionFetchViewModel(fetchUseCase: makeFetchAttractionUseCase())
    }
    func makeAttractionCreateViewModel() -> AttractionCreateViewModel {
        AttractionCreateViewModel(fetchUseCase: makeCreateAttractionUseCase())
    }
    func makeAttractionDeleteViewModel() -> AttractionDeleteViewModel {
        AttractionDeleteViewModel(fetchUseCase: makeDeleteAttractionUseCase())
    }
    func makeAttractionEditViewModel() -> AttractionEditViewModel {
        AttractionEditViewModel(fetchUseCase: makeEditAttractionUseCase())
    }
    func makeAttractionsMyFetchViewModel() -> AttractionsMyFetchViewModel {
        AttractionsMyFetchViewModel(fetchUseCase: makeFetchMyAttractionsUseCase())
    }
    func makeAttractionSearchByNameViewModel() -> AttractionSearchByNameViewModel {
        AttractionSearchByNameViewModel(fetchUseCase: makeSearchAttractionByNameUseCase())
    }
    func makeAttractionSearchByTypeAndNameViewModel() -> AttractionSearchByTypeAndNameViewModel {
        AttractionSearchByTypeAndNameViewModel(fetchUseCase: makeSearchAttractionByTypeAndNameUseCase())
    }
    func makeAttractionSearchByTypeAndAddressViewModel() -> AttractionSearchByTypeAndAddressViewModel {
        AttractionSearchByTypeAndAddressViewModel(fetchUseCase: makeSearchAttractionByTypeAndAddressUseCase())
    }

    // MARK: - Discussion ViewModels
    func makeDiscussionsFetchViewModel() -> DiscussionsFetchViewModel {
        DiscussionsFetchViewModel(fetchUseCase: makeFetchDiscussionsUseCase())
    }
    func makeDiscussionCreateViewModel() -> DiscussionCreateViewModel {
        DiscussionCreateViewModel(fetchUseCase: makeCreateDiscussionUseCase())
    }
    func makeDiscussionDeleteViewModel() -> DiscussionDeleteViewModel {
        DiscussionDeleteViewModel(fetchUseCase: makeDeleteDiscussionUseCase())
    }

    // MARK: - Facility ViewModels
    func makeFacilitiesFetchViewModel() -> FacilitiesFetchViewModel {
        FacilitiesFetchViewModel(fetchUseCase: makeFetchFacilitiesUseCase())
    }
    func makeFacilityCreateViewModel() -> FacilityCreateViewModel {
        FacilityCreateViewModel(createUseCase: makeCreateFacilityUseCase())
    }

    // MARK: - Poster ViewModels
    func makePostersFetchViewModel() -> PostersFetchViewModel {
        PostersFetchViewModel(fetchUseCase: makeFetchPostersUseCase())
    }
    func makePosterCreateViewModel() -> PosterCreateViewModel {
        PosterCreateViewModel(createUseCase: makeCreatePosterUseCase())
    }

    // MARK: - User ViewModels
    func makeSignInViewModel() -> SignInViewModel {
        SignInViewModel(signInUseCase: makeSignInUseCase(), env: self)
    }
    func makeSignUpFirstStepViewModel() -> SignUpFirstStepViewModel {
        SignUpFirstStepViewModel(signUpFirstStepUseCase: makeSignUpFirstStepUseCase())
    }
    func makeSignUpSecondStepViewModel() -> SignUpSecondStepViewModel {
        SignUpSecondStepViewModel(signUpSecondStepUseCase: makeSignUpSecondStepUseCase())
    }
    // Если UseCase пока нет, возвращаем ViewModel с nil UseCase (или создайте временный Mock)
    func makeResetPasswordViewModel() -> ResetPasswordViewModel {
        ResetPasswordViewModel(resetUseCase: makeResetPasswordUseCase()) // нужно реализовать ResetPasswordUseCase
    }
    func makeCurrentUserFetchViewModel() -> CurrentUserFetchViewModel {
        CurrentUserFetchViewModel(fetchUseCase: makeFetchCurrentUserUseCase())
    }
    func makeCurrentUserDeleteViewModel() -> CurrentUserDeleteViewModel {
        CurrentUserDeleteViewModel(deleteUseCase: makeDeleteCurrentUserUseCase())
    }
    func makeSaveProfileChangesViewModel() -> SaveProfileChangesViewModel {
        SaveProfileChangesViewModel(saveUseCase: makeSaveProfileChangesUseCase())
    }
}
