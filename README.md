# YouSuckAtMath.com

## Vision
Democratizing access to advanced mathematics education by leveraging AI technology to provide personalized learning experiences.

## Mission
Create an open-source, free platform that helps users overcome mathematical challenges through AI-assisted learning, comprehensive textbook integration, and customizable learning paths.

## About
YouSuckAtMath.com aims to revolutionize mathematics education by providing an AI-powered platform that extends beyond the K-12 level offered by platforms like Khan Academy. The platform supports college-level math courses through a comprehensive collection of catalogued textbooks and customized learning paths.

## Key Features
- AI-powered math tutoring with step-by-step solutions
- Support for college-level courses and textbooks
- Personalized learning paths for various specializations
- Comprehensive textbook integration with RAG-based retrieval
- Progress tracking and adaptive learning

## Project Structure

- `client/`: Frontend Progressive Web App
- `mobile/`: Mobile application (future phase)
- `server/`: Backend services and API
  - `api/`: RESTful API endpoints
  - `auth/`: Authentication service
  - `ai_tutor/`: AI tutoring service
  - `textbook/`: Textbook processing and retrieval
  - `learning_path/`: Learning path management
  - `progress/`: User progress tracking
  - `rag/`: Retrieval-augmented generation system
  - `vector_store/`: Vector database interface
  - `models/`: AI/ML models
  - `db/`: Database models and migrations
  - `storage/`: Object storage service
  - `utils/`: Shared utilities
- `scripts/`: Data processing and automation scripts
- `tests/`: Unit and integration tests
- `docs/`: Documentation and specifications

## Getting Started

1. Copy `.env.example` to `.env` and configure your environment variables
2. See `client/README.md` and `server/README.md` for component-specific setup instructions
3. Review `docs/phase1_mvp_gameplan.md` for implementation plans

## Tech Stack

### Frontend
- React (PWA)
- Modern JavaScript/TypeScript
- Responsive UI frameworks

### Backend
- Python/FastAPI or Node.js
- JWT authentication
- PostgreSQL & vector databases
- LLM integration

## Team

- Product Owner: [Name]
- Tech Lead: [Name]
- Frontend Engineers: [Names]
- Backend Engineers: [Names]
- AI/ML Engineers: [Names]

## Contributing

See `CONTRIBUTING.md` for development workflow and contribution guidelines.

## License

Open source under MIT license.
