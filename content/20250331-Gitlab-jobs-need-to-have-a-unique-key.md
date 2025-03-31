
+++
title = "Gitlab CI jobs need to have a unique key"
date = 2025-03-31T13:12:37

[extra]
author = "Victor Viale"

[taxonomies]
tags = ["Gitlab", "CI"]
+++

Especially punitive when working with includes from local files or external components, if you have a job that is running for different environments (say staging and production), with the given component: 

```yaml
# my-component.yml

spec:
  inputs:
    environment:
      type: string

---

do-something:
  script:
    - echo $[[ inputs.environment ]]
```

the following `.gitlab-ci.yml`

```yaml
# .gitlab-ci.yaml

include:
  - component: $CI_SERVER_FQDN/my-project/my-component@1.0.0
    inputs:
      environment: staging
  - component: $CI_SERVER_FQDN/my-project/my-component@1.0.0
    inputs:
      environment: production
```

will be compiled to 

```yaml
do-something:
  script:
    - echo "production"
```

because the key `do-something` is duplicated across instanciations of the component.

A solution to this is adding the `environment` key to the name of the job:

```yaml
# my-component.yml

spec:
  inputs:
    environment:
      type: string

---

do-something:$[[ inputs.environment ]]:
  script:
    - echo $[[ inputs.environment ]]
```