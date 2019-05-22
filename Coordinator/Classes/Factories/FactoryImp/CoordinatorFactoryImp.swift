import Timeline

public final class CoordinatorFactoryImp: CoordinatorFactory {
    
    public init() {}
    
    public func makeTimelineCoordinator(router: Router) -> Coordinator {
        let coordinator = TimelineCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }
    
}
