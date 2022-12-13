package main

import "os"

import (
	zmq_connector "github.com/solenopsys/sc-bl-zmq-connector"
	"k8s.io/client-go/kubernetes"
	"sigs.k8s.io/controller-runtime/pkg/client"
)

var clientSet *kubernetes.Clientset
var c client.Client
var devMode = os.Getenv("developerMode") == "true"

const ConfigmapName = "helm-repositories"
const NameSpace = "default"

func main() {
	clientSet, c = createKubeConfig()
	template := zmq_connector.HsTemplate{Pf: processingFunction()}
	template.Init()
}
