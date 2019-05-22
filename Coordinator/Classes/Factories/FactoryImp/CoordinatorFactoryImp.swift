final class CoordinatorFactoryImp: CoordinatorFactory {
    func makeTimelineCoordinator(router: Router) -> Coordinator {
        //TODOs: consumir  o coordinator
        return TimelineCoordinator()
    }
}
