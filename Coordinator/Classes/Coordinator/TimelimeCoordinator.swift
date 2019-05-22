import Timeline

final class TimelineCoordinator: BaseCoordinator {
    private let factory: TimelineFactory
    private let router: Router

    init(router: Router, factory: TimelineFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showTimeline()
    }
    
    //MARK: Run current flow's controllers
    
    private func showTimeline() {
        let timelineOutput = factory.makeTimelineOutput(delegate: self)
        router.setRootModule(timelineOutput)
    }
    
    private func showTimelineItemDetail(with id: Int) {
        print("Deverá mostra objt:\(id)")
    }
    
}

extension TimelineCoordinator: TimelineRouteringDelegate {
    public func showItemDetail(with id: Int) {
        showTimelineItemDetail(with: id)
    }
}
