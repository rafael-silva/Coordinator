public protocol CoordinatorFactory {
    func makeTimelineCoordinator(router: Router) -> Coordinator
}
