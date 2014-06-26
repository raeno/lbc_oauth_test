# Simple task list site to test oauth authorization using Loginbycall.

## Steps to configure oauth integration:
1. Register new oauth application on loginbycall.com ( or local version )
2. Change client_secret and client_id in config/oauth.yml to provided values
3. Feel free to edit other params in oauth.yml config to tune oauth behavior
4. Launch application with "rails s -p 3001" We assume that 3000 port is busy with local LBC server
5. Visit localhost:3001 and click 'Login with Loginbycall"