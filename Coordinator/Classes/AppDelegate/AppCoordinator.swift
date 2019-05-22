import UIKit
import Timeline

public class AppCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    public init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override public func start() {
        let coordinator = coordinatorFactory.makeTimelineCoordinator(router: router)
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }
}   
