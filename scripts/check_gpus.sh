python3.10 - <<'PY'
import os, torch
print("GPUs:", torch.cuda.is_available())
print("Nums of GPUs:", torch.cuda.device_count())
if torch.cuda.is_available():
    print("GPU:", torch.cuda.get_device_name(0))
PY