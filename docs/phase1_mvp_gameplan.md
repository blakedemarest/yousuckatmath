# Phase 1: MVP Implementation Gameplan

## Overview
This document outlines the structured gameplan for Phase 1 (MVP) of YouSuckAtMath.com, including objectives, milestones, tasks, and a sequential daily to-do list. Each task specifies the project structure location and any dependencies.

---

## Phase 1 Objectives
- Implement basic user accounts and profiles
- Develop AI tutor with question answering capabilities
- Catalog 10-20 popular textbooks
- Create simple learning paths for core subjects
- Launch a functional web-based interface

---

## Milestones & Key Tasks

### Milestone 1: Project Setup & Environment
- Initialize Git repository
- Configure environment variables and secrets
- Set up code linting, formatting, and pre-commit hooks
- Establish documentation and project management practices

### Milestone 2: Frontend (Web PWA) Scaffold
- Scaffold React project in `client/`
- Set up routing, basic page layout, and global styles
- Implement authentication UI (login/register)

### Milestone 3: Backend API Scaffold
- Scaffold API service in `server/`
- Implement authentication endpoints
- Set up database models for users and profiles

### Milestone 4: AI Tutor Prototype
- Integrate AI tutor microservice in `server/ai_tutor/`
- Connect frontend to AI tutor API

### Milestone 5: Textbook Catalog & Learning Paths
- Implement textbook ingestion pipeline in `scripts/` and `server/textbook/`
- Create endpoints for textbook retrieval and learning path creation
- Display catalog and learning paths in frontend

### Milestone 6: User Progress Tracking
- Add user progress models and endpoints in `server/progress/`
- UI for tracking and displaying progress

### Milestone 7: MVP Launch & QA
- End-to-end testing
- Bug fixes and polish
- Prepare deployment scripts and documentation

---

## Sequential Daily To-Do List (First 2 Weeks)

### **Day 1: Project Initialization** ✅
- [x] Review PRD and docs in `docs/` *(completed: PRD reviewed and used for project skeleton)*
- [x] Initialize Git repository *(completed: Git repository already initialized)*
- [x] Set up `.gitignore` and `.env.example` in root *(completed: both files created)*
- [x] Project structure creation *(completed: skeleton directory structure created)*
- [x] Basic README.md created *(but requires more detailed team/project info)*

**Next Day 1 Tasks:**
1. Enhance `README.md` with detailed project introduction, team info, and tech stack details
2. Create `CONTRIBUTING.md` in root with development workflow guidelines
3. Document project architecture in `docs/architecture.md` based on PRD system diagrams
4. Set up issue/task tracking system (GitHub Issues, Jira, etc.)

### **Day 2: Tooling & Workflow** ✅
- [x] Set up code formatter and linter (ESLint/Prettier for JS, Black/isort for Python) *(completed: ESLint/Prettier for frontend, Black/isort/Flake8 for Python)*
- [x] Configure pre-commit hooks in root *(completed: pre-commit config created with Git hooks for formatting and linting)*
- [x] Establish branch naming and commit message conventions *(completed: git-workflow.md with detailed branching strategy and commit message standards)*

**Additional Day 2 Tasks Completed:**
1. Created EditorConfig for cross-editor consistency
2. Added VSCode settings for team development
3. Set up package.json with frontend dependencies
4. Created requirements.txt for backend dependencies
5. Added development environment setup scripts for both Windows and Unix systems

### **Day 3: Frontend Scaffold**
- [ ] Initialize React project in `client/`
- [ ] Set up base folder structure (`components/`, `pages/`, etc.)
- [ ] Add routing (React Router)
- [ ] Create placeholder pages (Home, Login, Register, Dashboard)

### **Day 4: Backend Scaffold**
- [ ] Initialize backend API project in `server/`
- [ ] Set up Python/Node environment (e.g., FastAPI, Express)
- [ ] Scaffold folder structure for microservices
- [ ] Create health check endpoint

### **Day 5: Database Setup**
- [ ] Choose DB (e.g., PostgreSQL)
- [ ] Set up local DB instance
- [ ] Create user and profile models in `server/db/`
- [ ] Prepare migration scripts

### **Day 6: Auth Backend**
- [ ] Implement registration and login endpoints in `server/api/` and `server/auth/`
- [ ] Add JWT-based authentication
- [ ] Write unit tests for auth endpoints in `tests/`

### **Day 7: Auth Frontend**
- [ ] Build login/register UI in `client/pages/` and `client/components/`
- [ ] Connect frontend to backend auth API via `client/services/`
- [ ] Add basic error handling and validation

### **Day 8: User Profiles**
- [ ] Implement user profile endpoints in `server/api/`
- [ ] Create profile UI in `client/pages/`
- [ ] Add profile editing and display functionality

### **Day 9: AI Tutor Service (Backend)**
- [ ] Scaffold `server/ai_tutor/` service
- [ ] Set up API endpoint for question answering
- [ ] Integrate with mock or real LLM (as available)

### **Day 10: AI Tutor UI (Frontend)**
- [ ] Create AI Tutor chat UI in `client/pages/`
- [ ] Connect to backend AI tutor API via `client/services/`
- [ ] Display responses and handle loading/errors

### **Day 11: Textbook Catalog**
- [ ] Implement textbook ingestion script in `scripts/`
- [ ] Create retrieval endpoints in `server/textbook/`
- [ ] Build catalog UI in `client/pages/`

### **Day 12: Learning Paths**
- [ ] Design simple learning path data model in `server/db/`
- [ ] Implement endpoints for creating/retrieving learning paths
- [ ] UI for displaying and selecting learning paths

### **Day 13: Progress Tracking**
- [ ] Add user progress models in `server/progress/`
- [ ] Implement endpoints for updating/fetching progress
- [ ] UI for progress tracking in `client/pages/`

### **Day 14: Testing & Review**
- [ ] Write additional unit/integration tests in `tests/`
- [ ] Review code for completeness and style
- [ ] Update documentation in `docs/`

---

## Dependencies & Preparation Notes
- Ensure local dev environments are set up for both frontend and backend
- Prepare API keys/secrets (if using external AI or DB services)
- Team should agree on code style and workflow conventions early
- Use `.env.example` as a template for all secrets/configs

---

## Remaining Phase 1 (Weeks 3-12)
- Continue feature development, QA, and polish per milestones above
- Plan for user feedback and iterative improvements
- Prepare for MVP deployment and documentation

---

**Stay disciplined: Complete each day’s checklist before moving on!**

---

_Last updated: 2025-06-01_
