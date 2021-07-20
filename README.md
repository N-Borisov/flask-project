# flask-project

The purpose of this project is to demonstrate automated deployment for a basic application environment consisting of the Python Flask web framework with a MySQL backend and Nginx for a load balancer. The automated setup also includes Prometheus monitoring.

Please note that the environment will only work on Red Hat like distros where yum and firewalld are in place. The only required package is git and the rest is handled by the scpripts.

Use git clone to download the repo and then start set-environment.sh, which will do the whole work for you.

Once it is finished, validate the application through your browser with http://your-ip  and Prometheus http://your-ip:9090/targets or FQDN.
