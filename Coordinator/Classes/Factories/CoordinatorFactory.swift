protocol CoordinatorFactory {
    func makeStartCoordinator(router: Router) -> Coordinator
}
