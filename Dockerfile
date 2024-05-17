# FROM nvcr.io/nvidia/pytorch:24.01-py3
FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-devel

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app/
RUN pip install -e .[metrics,bitsandbytes,qwen]

VOLUME [ "/root/.cache/huggingface/", "/app/data", "/app/output" ]
EXPOSE 7860


# fix 
RUN pip install auto_gptq>=0.5.0 optimum autoawq

CMD [ "llamafactory-cli", "webui" ]

