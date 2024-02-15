LOCAL_PATH = os.getenv("LOCAL_PATH", default='.')
NAMESPACE = os.getenv("NAMESPACE", default='default')
WAIT_TIMEOUT = os.getenv("WAIT_TIMEOUT", default='10m00s')
TYPE = os.getenv("TYPE", default='web')

k8s_custom_deploy(
    'APP_NAME',
    apply_cmd="tanzu apps workload apply -f WORKLOAD_FILENAME --update-strategy replace --debug --live-update" +
              " --local-path " + LOCAL_PATH +
              " --namespace " + NAMESPACE +
              " --wait-timeout " + WAIT_TIMEOUT +
              " --type " + TYPE +
              " --yes --output yaml",
    delete_cmd="tanzu apps workload delete -f WORKLOAD_FILENAME --namespace " + NAMESPACE + " --yes",
    deps=['pom.xml', './target/classes'],
    container_selector='workload',
    live_update=[
      sync('./target/classes', '/workspace/BOOT-INF/classes')
    ]
)

k8s_resource('APP_NAME', port_forwards=["8080:8080"],
            extra_pod_selectors=[{'carto.run/workload-name': 'APP_NAME','app.kubernetes.io/component': 'run'}])

allow_k8s_contexts('KUBE_CONTEXT')