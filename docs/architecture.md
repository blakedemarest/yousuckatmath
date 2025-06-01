# YouSuckAtMath.com System Architecture

This document outlines the system architecture for YouSuckAtMath.com based on the specifications in the Product Requirements Document (PRD).

## Table of Contents
- [Architecture Overview](#architecture-overview)
- [Component Descriptions](#component-descriptions)
- [Data Model](#data-model)
- [API Design](#api-design)
- [Authentication & Security](#authentication--security)
- [AI Integration](#ai-integration)
- [Deployment Architecture](#deployment-architecture)

## Architecture Overview

YouSuckAtMath.com is built using a multi-layered architecture to ensure scalability, maintainability, and performance. The system consists of the following layers:

```
Client Layer → Application Layer → Data Processing Layer → Storage Layer
```

### System Architecture Diagram

```mermaid
flowchart TB
    subgraph "Client Layer"
        WebUI[Web Interface]
        MobileApp[Mobile App]
    end

    subgraph "Application Layer"
        API[RESTful API Service]
        Auth[Authentication Service]
        AIService[AI Tutor Service]
        TextbookService[Textbook Service]
        LearningPathService[Learning Path Service]
        ProgressService[Progress Tracking]
    end

    subgraph "Data Processing Layer"
        TextbookProcessor[Textbook Processor]
        RAGSystem[RAG System]
        VectorStore[Vector Database]
        AIModels[AI/ML Models]
    end

    subgraph "Storage Layer"
        RelationalDB[(Relational Database)]
        DocumentDB[(Document Database)]
        ObjectStorage[(Object Storage)]
    end

    WebUI <--> API
    MobileApp <--> API
    
    API <--> Auth
    API <--> AIService
    API <--> TextbookService
    API <--> LearningPathService
    API <--> ProgressService
    
    AIService <--> RAGSystem
    AIService <--> AIModels
    TextbookService <--> TextbookProcessor
    TextbookProcessor <--> RAGSystem
    RAGSystem <--> VectorStore
    
    Auth <--> RelationalDB
    ProgressService <--> RelationalDB
    LearningPathService <--> RelationalDB
    TextbookService <--> DocumentDB
    RAGSystem <--> DocumentDB
    TextbookProcessor <--> ObjectStorage
```

## Component Descriptions

### Client Layer
- **Web Interface**: Progressive Web App (PWA) built with React, providing responsive UI for all devices
- **Mobile App**: Native or hybrid mobile application for iOS and Android (planned for Phase 3)

### Application Layer
- **RESTful API Service**: Core backend service handling client requests and orchestrating other services
- **Authentication Service**: Manages user authentication, authorization, and session management
- **AI Tutor Service**: Provides AI-powered tutoring, question answering, and problem-solving assistance
- **Textbook Service**: Handles textbook metadata, content retrieval, and search
- **Learning Path Service**: Manages creation, retrieval, and progression of learning paths
- **Progress Tracking**: Monitors and reports user progress through textbooks and learning paths

### Data Processing Layer
- **Textbook Processor**: Ingests, parses, and structures textbook content for use in the platform
- **RAG System**: Retrieval-Augmented Generation system for context-aware AI responses
- **Vector Database**: Stores embeddings for semantic search and retrieval
- **AI/ML Models**: Machine learning models for tutoring, content analysis, and personalization

### Storage Layer
- **Relational Database**: Stores structured data (users, progress, learning paths)
- **Document Database**: Stores semi-structured data (textbook content, questions, solutions)
- **Object Storage**: Stores binary files (images, PDFs, original textbooks)

## Data Model

The core entities in the system and their relationships:

```mermaid
erDiagram
    USER {
        string id PK
        string email
        string passwordHash
        date createdAt
        date updatedAt
        string preferredLearningStyle
    }
    
    TEXTBOOK {
        string id PK
        string title
        string author
        string publisher
        string isbn
        string coverUrl
        string description
        int edition
        date publicationDate
        string category
    }
    
    SECTION {
        string id PK
        string textbookId FK
        string title
        int chapterNumber
        int sectionNumber
        string content
        array prerequisites
        string difficulty
    }
    
    COURSE {
        string id PK
        string title
        string description
        string institution
        string instructor
        string level
        array prerequisites
    }
    
    LEARNING_PATH {
        string id PK
        string userId FK
        string title
        string description
        date createdAt
        date updatedAt
    }
    
    LEARNING_PATH_ITEM {
        string id PK
        string learningPathId FK
        string itemType
        string itemId
        int order
        string dependencies
    }
    
    USER_PROGRESS {
        string id PK
        string userId FK
        string itemType
        string itemId
        float completionPercentage
        date lastAccessed
        string status
        string notes
    }
    
    USER_INTERACTION {
        string id PK
        string userId FK
        string sessionId
        string interactionType
        string contextId
        string query
        string response
        date timestamp
        float helpfulnessRating
    }

    USER ||--o{ LEARNING_PATH : creates
    TEXTBOOK ||--o{ SECTION : contains
    LEARNING_PATH ||--o{ LEARNING_PATH_ITEM : contains
    COURSE ||--o{ LEARNING_PATH_ITEM : referenced_by
    SECTION ||--o{ LEARNING_PATH_ITEM : referenced_by
```

## API Design

The platform uses a RESTful API design with the following major endpoints:

### Authentication API
- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/refresh`
- `POST /api/auth/logout`

### User API
- `GET /api/users/:id`
- `PUT /api/users/:id`
- `GET /api/users/:id/progress`

### Textbook API
- `GET /api/textbooks`
- `GET /api/textbooks/:id`
- `GET /api/textbooks/:id/sections`
- `GET /api/textbooks/:id/sections/:sectionId`

### Learning Path API
- `GET /api/learning-paths`
- `POST /api/learning-paths`
- `GET /api/learning-paths/:id`
- `PUT /api/learning-paths/:id`
- `DELETE /api/learning-paths/:id`
- `GET /api/learning-paths/:id/items`

### AI Tutor API
- `POST /api/ai/question` - Ask a question
- `POST /api/ai/solve` - Solve a problem
- `POST /api/ai/explain` - Explain a concept
- `POST /api/ai/feedback` - Get feedback on a solution

## Authentication & Security

```mermaid
sequenceDiagram
    participant A as Client
    participant B as API Gateway
    participant C as Authentication Service
    participant D as Identity Provider
    participant E as Protected API
    participant F as Authorization Service
    participant G as Permission Database
    participant H as Protected Services

    A->>B: Request with credentials
    B->>C: Authenticate User
    C->>D: Verify Identity
    D-->>C: Identity Confirmed
    C-->>B: Generate JWT
    B-->>A: Return JWT
    
    A->>E: Request with JWT
    E->>F: Validate JWT
    F->>G: Check Permissions
    F-->>E: Allow/Deny
    E-->>H: Forward Request
```

Security features:
- JWT-based authentication
- Role-based access control (RBAC)
- Data encryption at rest and in transit
- API rate limiting
- OAuth 2.0 support for third-party integrations
- GDPR and COPPA compliance measures
- Regular security audits and penetration testing

## AI Integration

### AI Tutor Workflow

```mermaid
flowchart TB
    A[User Question] --> B[Question Processing]
    B --> C[Context Retrieval]
    
    C --> D[Textbook Context]
    C --> E[Course Context]
    C --> F[User Context]
    
    D --> G[RAG System]
    E --> G
    F --> G
    
    G --> H[AI Response Generation]
    
    H --> I[Step Generation]
    H --> L[Question Understanding]
    H --> M[Knowledge Retrieval]
    
    L --> N[Concept Identification]
    N --> O[Level Adaptation]
    O --> P[Multimodal Explanation]
    
    I --> Q[Response Formatting]
    M --> Q
    P --> Q
    Q --> R[User Response]
```

### Textbook Processing Pipeline

```mermaid
flowchart TB
    A[Textbook Source] -->|Upload| B[Document Processor]
    
    B -->|PDF Extraction| C[Content Extraction]
    B -->|EPUB Processing| C
    B -->|HTML Processing| C
    
    C --> D[Structure Analysis]
    D --> E[Section Identification]
    E --> F[Concept Extraction]
    
    F --> G[Math Expression Processing]
    F --> H[Text Processing]
    F --> I[Image Processing]
    
    G --> J[Formula Indexing]
    H --> K[Text Embedding]
    I --> L[Image Analysis]
    
    J --> M[Knowledge Graph Construction]
    K --> M
    L --> M
    
    M --> N[Vector Embedding]
    N --> O[RAG System Integration]
```

## Deployment Architecture

Production deployment uses containerized microservices for scalability and maintainability:

```mermaid
flowchart TB
    A[Load Balancer] --> B[API Gateway]
    
    B --> C[Authentication Service]
    B --> D[User Service]
    B --> E[AI Service]
    B --> F[Textbook Service]
    B --> G[Learning Path Service]
    
    C --> H[User DB]
    D --> H
    
    E --> I[Vector DB]
    E --> J[LLM Service]
    
    F --> K[Document DB]
    F --> L[Object Storage]
    
    G --> H
    G --> K
```

### Development & Staging Environments

- Local development environment using Docker Compose
- CI/CD pipeline with automated testing
- Staging environment that mirrors production
- Blue-green deployment strategy for zero-downtime updates

### Monitoring & Logging

```mermaid
flowchart TB
    A[Application Logs] --> B[Log Aggregator]
    C[System Metrics] --> D[Metrics Collector]
    E[User Analytics] --> F[Analytics Platform]
    G[AI Performance] --> H[AI Monitoring]
    
    B --> I[Centralized Logging]
    D --> J[Metrics Dashboard]
    F --> K[User Behavior Analysis]
    H --> L[AI Quality Monitoring]
    
    I --> M[Alert System]
    J --> M
    L --> M
```

This architecture provides a solid foundation for YouSuckAtMath.com, allowing for both current MVP needs and future scalability as the platform grows.
