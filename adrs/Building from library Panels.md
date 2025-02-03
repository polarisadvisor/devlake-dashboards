## Architecture Decision Record (ADR) – Grafana Dashboard Provisioning
### Context:
Currently, Devlake deploys dashboards using file based provisioning. This means that the unit of development is a complete dashboard. 
Grafana has the ability to compose dashboards out of library panels, but library panels cannot be provisioned - they need to be 
managed in the UI or via the API. 


### 1. Options Considered

#### **Stay with static Deployment of Dashboards (File-Based Provisioning)**  
- Dashboards are stored as JSON files in a predefined directory and loaded by Grafana at startup.  
- No external dependencies or authentication required.  
- Updates require modifying JSON files and restarting Grafana.  

#### **Dynamic Deployment of Dashboards and Library Panels (API-Based Provisioning)**  
- Dashboards and reusable **library panels** are provisioned dynamically via the Grafana API.  
- This allows modular dashboards that share common components, reducing duplication.  
- Updates can be made via API without restarting Grafana.  
- Requires authentication (API key or service account token) and sequencing (library panels must exist before dashboards).  

**Problems the Dynamic Approach Solves:**  
- **Ease of Development:** Easier to develop and test a library of independent metrics widgets than a large collection of specialized dashboards.
- **Reusability:** Library panels can be updated once and reflected across multiple dashboards.  
- **Maintainability:** API-based updates allow changes without container restarts.  
- **Modularity:** Dashboards can be assembled dynamically from shared components.
---

### 2. Decision: Static Deployment of Dashboards

We chose **file-based provisioning** for simplicity and security:  
- Dashboards are preloaded from JSON files at container startup.  
- A provisioning config (`dashboards.yaml`) defines the dashboard source directory.  
- No authentication or API access is required.  
- Updates require modifying dashboard files and restarting the container.  

#### **Why this approach?**
- ✅ **Secure & Predictable:** No need for API keys or admin authentication.  
- ✅ **Easier to Deploy:** No dependency on Grafana’s API or service account management.  
- ❌ **Less Modular:** Library panels cannot be reused across dashboards.  
- ❌ **Manual Updates:** Changing dashboards requires file modifications and container restarts.  

Until we hit significant friction, we prioritize **simplicity over flexibility**.  

---

### 3. Option Not Taken: Dynamic Deployment via API

We did **not** choose API-based provisioning due to operational complexity. **for now** :  
- Requires **managing authentication** via service accounts or API keys.  
- Involves **ordering dependencies**, ensuring library panels exist before dashboards reference them.  
- Introduces potential **errors** if API provisioning fails during startup.  
- **Security risk:** Embedding admin credentials in the container startup process is undesirable.  

If file-based provisioning proves insufficient, we may revisit this approach. A future transition would involve **manual pre-creation of a service account**, with its token passed securely to the provisioning container.  

**Status:** **Accepted – Static provisioning via filesystem**
