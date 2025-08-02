from fastapi import FastAPI

app = FastAPI(title="Aura Backend")

@app.get("/api/health")
def health_check():
    """Health check endpoint"""
    return {"status": "ok"}

@app.get("/api")
def read_root():
    return {"message": "Welcome to the Aura API!"}
