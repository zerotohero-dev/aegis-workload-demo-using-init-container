# Aegis

![Aegis](assets/aegis-icon.png "Aegis")

keep your secrets… secret

## Aegis Workload Demo

This is a demo Kubernetes deployment to test Aegis on a cluster.

In this particular case, we leverage [**Aegis Go SDK**][aegis-sdk-go] instead 
of using a sidecar and directly access **Aegis Safe**. Additionally, we leverage
an **Aegis Init Container** to start the main container of the workload 
only after a secret is  successfully registered to the workload.

[aegis-sdk-go]: https://github.com/zerotohero-dev/aegis-sdk-go
[aegis-demo-sidecar]: https://github.com/zerotohero-dev/aegis-workload-demo-using-sidecar

[Check out Aegis’ README][aegis-readme] for more information about the project,
high level design, contributing guidelines, and code of conduct.

[aegis]: https://github.com/zerotohero-dev/aegis "Aegis"
[aegis-readme]: https://github.com/zerotohero-dev/aegis/blob/main/README.md "Aegis README"
