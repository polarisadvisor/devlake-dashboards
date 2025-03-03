# DevLake Dashboards Developer Guidelines

## Project Overview
The DevLake Dashboards project provides open-source Grafana dashboards for Apache DevLake, offering enhanced visibility and metrics for measuring key aspects of your product and delivery process. This project is maintained as part of The Polaris Advisor Program and shares the same Apache 2.0 license as Apache DevLake.

### Relationship with Apache DevLake
- This project extends Apache DevLake's visualization capabilities by providing additional specialized dashboards
- Uses the same data model and MySQL database as Apache DevLake
- Complements the core dashboards while maintaining compatibility with the main project
- Can be deployed as a drop-in replacement for the standard Grafana service in Apache DevLake

## Dashboard Development

### Architecture Decisions
1. **Dashboard Provisioning Approach**
   - Uses file-based provisioning for simplicity and security
   - Dashboards are stored as JSON files and loaded at startup
   - No external dependencies or authentication required
   - Updates require modifying JSON files and restarting Grafana

2. **Future Considerations**
   - Potential migration to API-based provisioning for more dynamic updates
   - Library panels support for better component reuse
   - Service account-based authentication for enhanced security

### Development Process
1. **Dashboard Creation**
   - Create or modify dashboard JSON files
   - Ensure proper datasource configuration (default: 'mysql')
   - Test queries and visualizations
   - Document assumptions and usage guidelines

2. **Best Practices**
   - Follow Grafana dashboard best practices
   - Maintain consistent naming conventions
   - Document variables and their usage
   - Include descriptions for panels and queries

## Deployment Process

### Standard Deployment
1. Pull the dashboard image:
   ```bash
   docker pull polarisadvisor/devlake-dashboards:latest
   ```

2. Replace the standard Grafana service in `docker-compose.yml`:
   ```yaml
   grafana:
     image: polarisadvisor/devlake-dashboards:latest
     # ... other configurations remain the same
   ```

3. Restart the containers:
   ```bash
   docker-compose down
   docker-compose up -d
   ```

### Manual Dashboard Import
- Individual dashboard JSON files can be imported directly into existing DevLake instances
- Ensure the MySQL datasource is configured with the name 'mysql'
- Dashboards are organized in the "Polaris Open Source" folder

## Testing Framework

### Technical Architecture
1. **Core Components**
   - Dashboard Parser (`dashboard.py`)
     * JSON parsing and manipulation
     * Variable and macro handling
     * Panel management
     * SQL query preprocessing
   
   - Database Layer (`db.py`)
     * SQLAlchemy integration
     * Connection pooling
     * Transaction management
     * Test isolation

2. **Testing Infrastructure**
   ```python
   # Example test setup
   def test_dashboard_query(db_session):
       dashboard = Dashboard("path/to/dashboard.json")
       panel = dashboard.find_panel_by_id(1)
       result = dashboard.execute(db_session, panel.panel_sql)
       # Assert expected results
   ```

### Key Features
1. **Query Testing**
   - Macro expansion support
   - Variable substitution
   - Time range handling
   - Transaction-based isolation

2. **Dashboard Structure Testing**
   - Panel validation
   - Variable verification
   - Datasource configuration checks

### Test Development
1. **Setup**
   - Use provided pytest fixtures
   - Leverage transaction rollbacks for isolation
   - Configure test data through fixtures

2. **Best Practices**
   - Write isolated tests
   - Use meaningful test data
   - Test edge cases
   - Document test assumptions

## Development Setup

### Prerequisites
- Docker and Docker Compose
- Python 3.8+
- MySQL 8.0+
- Grafana understanding

### Local Development
1. Clone the repository
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Set up test database:
   ```bash
   # Configure DATABASE_URL environment variable
   export DATABASE_URL="mysql+pymysql://test:test@localhost:3306/lake"
   ```

4. Run tests:
   ```bash
   pytest dashboard_testing/tests/
   ```

## Additional Resources
- [Apache DevLake Documentation](https://devlake.apache.org/docs/)
- [Grafana Documentation](https://grafana.com/docs/)
- [Project Issues](https://github.com/apache/incubator-devlake/issues)