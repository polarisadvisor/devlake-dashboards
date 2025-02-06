# Use the latest stable Python image
FROM python:3.12

# Set environment variables for Poetry
ENV POETRY_VERSION=1.7.1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="${POETRY_HOME}/bin:$PATH"

# Set working directory
WORKDIR /app

# Copy pyproject.toml and poetry.lock if it exists
COPY pyproject.toml poetry.lock* ./

# Disable virtualenvs and install dependencies globally
RUN poetry config virtualenvs.create false && poetry install --no-root --with dev --no-interaction


# Move poetry.lock to a safe location for later extraction
RUN cp poetry.lock /poetry.lock