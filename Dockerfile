# ==============================================================================
# YUCT AWARE ENGINE ISOLATED DEPLOYMENT ENVIRONMENT
# File: Dockerfile
# Repository: yuct-ai-connectome
# Version: 38.0-Pure (Lattice Integration Check)
# ==============================================================================

FROM python:3.11-alpine

LABEL maintainer="Alexey V. Yakushev <alexey@yuct.org>"
LABEL theory="Yakushev Unified Coordination Theory (YUCT)"
LABEL engine.version="38.0-Pure"
LABEL open.science.doi="10.5281/zenodo.18444598"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY yuct_constants.py .
COPY yuct_master_lagrangian_core.py .
COPY tests/ ./tests/
COPY examples/ ./examples/

RUN adduser -D yuctuser && chown -R yuctuser:yuctuser /app
USER yuctuser

CMD ["python", "-m", "unittest", "tests/test_cirelson.py"]
