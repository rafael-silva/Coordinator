public class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    public func start() {}
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator}
    }
    
}
