
+++
title = "Parse what is possibly invalid JSON with JQ"
date = 2025-10-03T10:25:01

[extra]
author = "Victor Viale"

[taxonomies]
tags = []
+++

```bash
echo "not json" | jq -R '. as $line | try (fromjson) catch $line
# > "not json"
```