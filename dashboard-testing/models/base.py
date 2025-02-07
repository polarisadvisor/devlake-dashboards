from sqlalchemy.orm import registry

# Singleton registry instance
mapper_registry = registry()
Base = mapper_registry.generate_base()
