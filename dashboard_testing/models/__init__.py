from .base import Base, mapper_registry

# Import all models so they are registered
from .domain import *  # Ensure all models are imported

# Configure registry after all models are loaded
mapper_registry.configure()
