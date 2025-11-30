# UIT_CS431-Deep-Learning_Application

- [piikerpham/Vietnamese-Qwen2.5-math-1.5B](https://huggingface.co/piikerpham/Vietnamese-Qwen2.5-math-1.5B): Fine-tuned reasoning model
- [full.ipynb](full.ipynb): baseline for training, evaluate (reasoning & agent model)
- [evaluate.ipynb](evaluate_model.ipynb): Evaluate model same as in full.ipynb
- [data_gen.ipynb](data_gen.ipynb) or [colab](https://colab.research.google.com/drive/1VmalCuPiZV9C8mfQAtAlzCnW7Ygu6TE7?fbclid=IwY2xjawOZUI5leHRuA2FlbQIxMQBzcnRjBmFwcF9pZAEwAAEelfnOkAB3dZEDmxXIjibVlKjqkphVLlDHALNC5gdxjgDiXZnjI230_ijxnlo_aem_bePo-RuZ8GKSCrFn5BbJ9A): Use this file to generate data for agent
- [train_data.csv](train_data.csv): Data generated for AI agent
- [Final Report](Docs/CS431.pdf): Read this for more details

---
## Models
- Qwen2.5-math-1.5B
- Llama3.2-1B
- Qwen2.5-math-1.5B agent

## Results
- check in [Final Report](Docs/CS431.pdf)

## Install and Run locally
- Python version: `3.12.12`
- [requirements.txt](requirements.txt): using this for install package
- [env.yml](env.yml): use this file for install stably

1) Create conda env with `env.yml`
  ```bash
  conda env create -f env.yml -n your_env_name
  ```
2) create env with `requirements.txt`:
```bash
conda create -n your_env_name python=3.12 -y
conda activate your_env_name
cd UIT_CS431-Deep-Learning_Application
pip install requirements.txt
```
