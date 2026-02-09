---
id: WEB-016
title: Implement File Storage & Delivery System
status: todo
priority: P1
created_at: 2026-02-09T12:00:00Z
created_by: "@FOUNDER"
started_at: ""
completed_at: ""
verified_at: ""
assigned_to: "[[Org Chart/ENG-BE/IDENTITY]]"
collaborators:
  - "[[Org Chart/ENG-FE/IDENTITY]]"
current_worker: ""
next_worker: ""
estimated_hours: 12
actual_hours: 0
dependencies:
  - WEB-007
  - WEB-008
  - WEB-011
blocks: []
is_active: false
verified_by: ""
phase_reviews: []
tags:
  - web
  - backend
  - storage
  - cloudflare
  - r2
  - P1
---

# WEB-016: Implement File Storage & Delivery System

## 🎯 Objective
Implement secure file storage using Cloudflare R2 with presigned URLs for upload and download, supporting project deliverables, client assets, and document management.

## 📖 Context
File sharing is critical for client collaboration. We need secure, scalable storage with proper access controls and efficient delivery.

**Features:**
- Secure file upload via presigned URLs
- File organization by project
- Access control (client vs internal)
- Image optimization
- Version history

---

## ✅ Definition of Done

### Phase 1: Cloudflare R2 Setup (ENG-BE)
- [ ] `[C1]` Create Cloudflare account
- [ ] `[C2]` Create R2 bucket
- [ ] `[C3]` Configure CORS policies
- [ ] `[C4]` Setup public/custom domain
- [ ] `[C5]` Configure lifecycle policies

### Phase 2: Storage Service (ENG-BE)
- [ ] `[S1]` Install AWS SDK (R2 is S3-compatible)
- [ ] `[S2]` Create storage configuration
- [ ] `[S3]` Implement presigned URL generation
- [ ] `[S4]` Add file metadata handling
- [ ] `[S5]` Create file deletion service

### Phase 3: Upload API (ENG-BE)
- [ ] `[U1]` POST /api/files/upload — Get presigned URL
- [ ] `[U2]` POST /api/files — Confirm upload & save metadata
- [ ] `[U3]` Add file validation (type, size)
- [ ] `[U4]` Generate thumbnails for images
- [ ] `[U5]` Scan uploads for malware (optional)

### Phase 4: Download & Access (ENG-BE)
- [ ] `[D1]` Generate presigned download URLs
- [ ] `[D2]` Implement access control checks
- [ ] `[D3]` Add URL expiration (1 hour)
- [ ] `[D4]` Track file downloads

### Phase 5: Client Upload UI (ENG-FE)
- [ ] `[UI1]` Create drag-and-drop upload zone
- [ ] `[UI2]` Show upload progress
- [ ] `[UI3]` Validate file type and size
- [ ] `[UI4]` Preview images before upload
- [ ] `[UI5]` Handle upload errors

### Phase 6: File Management UI (ENG-FE)
- [ ] `[M1]` Create file list component
- [ ] `[M2]` Add file preview (images, PDFs)
- [ ] `[M3]` Implement file download
- [ ] `[M4]` Add file delete (with confirmation)
- [ ] `[M5]` Show file metadata (size, date, uploader)
- [ ] `[M6]` Add folder/organization (optional)

### Phase 7: Approval Workflow (ENG-BE + ENG-FE)
- [ ] `[A1]` Add approval status to files
- [ ] `[A2]` Create approve/reject actions
- [ ] `[A3]` Send notifications on approval status change
- [ ] `[A4]` Show approval history

### Phase 8: Image Optimization (ENG-BE)
- [ ] `[I1]` Setup Cloudflare Images (or Sharp)
- [ ] `[I2]` Generate responsive image variants
- [ ] `[I3]` Create image transformation URLs
- [ ] `[I4]` Implement lazy loading support

### Phase 9: Version Control (ENG-BE)
- [ ] `[V1]` Track file versions
- [ ] `[V2]` Store previous versions
- [ ] `[V3]` Allow version restoration
- [ ] `[V4]` Show version history

### Phase 10: Storage Management (ENG-BE)
- [ ] `[SM1]` Calculate storage usage per project
- [ ] `[SM2]` Implement storage quotas
- [ ] `[SM3]` Add cleanup jobs for old files
- [ ] `[SM4]` Generate storage reports

### Phase 11: Security (ENG-BE)
- [ ] `[SEC1]` Validate all file types
- [ ] `[SEC2]` Scan for executable files
- [ ] `[SEC3]` Implement virus scanning (ClamAV or similar)
- [ ] `[SEC4]` Audit file access logs

### Phase 12: Testing (ENG-BE + ENG-FE)
- [ ] `[T1]` Test upload flow end-to-end
- [ ] `[T2]` Test large file uploads
- [ ] `[T3]` Test download with presigned URLs
- [ ] `[T4]` Test access control
- [ ] `[T5]` Test image optimization

---

## 📝 Work Log

### 2026-02-09 12:00 @FOUNDER — Task Created
**Progress:** Task initialized  
**Completed:** None  
**Todos:** 
- [ ] Create Cloudflare account
- [ ] Setup R2 bucket
**Blockers:** 
- WEB-007 (Database)
- WEB-008 (Authentication)
- WEB-011 (API)  
**Notes:** R2 has zero egress fees — significant cost savings vs S3 for file downloads.

---

## 🚧 Blockers

**Current blockers:**
- WEB-007 (Database Infrastructure)
- WEB-008 (Authentication System)
- WEB-011 (Core REST API)

---

## 💬 Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-02-09 | Cloudflare R2 vs S3 | Zero egress fees, S3-compatible, simpler |
| 2026-02-09 | Presigned URLs for uploads | Secure, offloads bandwidth from server |
| 2026-02-09 | 100MB file size limit | Reasonable for design files, prevents abuse |

---

## 🔗 Related

- **Parent:** [ROADMAP.md](./ROADMAP.md) — Phase 2: Client Portal MVP
- **Depends on:** 
  - WEB-007 (Database)
  - WEB-008 (Authentication)
  - WEB-011 (API)
- **Blocks:** None
- **Related:**
  - [[WEB-009-client-portal-dashboard]] — Files displayed here

---

## 📐 Technical Notes

### Upload Flow
```
1. Client requests upload URL
   POST /api/files/upload
   { filename: "design-v1.pdf", contentType: "application/pdf" }

2. Server generates presigned URL
   → Returns { uploadUrl, fileId, fields }

3. Client uploads directly to R2
   PUT uploadUrl (or POST with fields)
   → File stored in R2

4. Client confirms upload
   POST /api/files
   { fileId, projectId, ... }
   → Metadata saved to database
```

### File Model
```typescript
interface File {
  id: string;
  name: string;
  fileName: string; // Original filename
  mimeType: string;
  size: number;
  
  // Storage
  bucket: string;
  key: string; // R2 object key
  url: string; // Public or presigned URL
  thumbnailUrl?: string;
  
  // Relations
  projectId?: string;
  uploadedById: string;
  
  // Approval workflow
  status: FileStatus;
  approvedById?: string;
  approvedAt?: Date;
  
  // Metadata
  category: FileCategory;
  version: number;
  
  createdAt: Date;
}

type FileStatus = 'PENDING' | 'APPROVED' | 'REJECTED';
type FileCategory = 'DESIGN' | 'ASSET' | 'DOCUMENT' | 'CONTRACT' | 'OTHER';
```

### Storage Configuration
```typescript
// lib/storage.ts
import { S3Client } from '@aws-sdk/client-s3';

export const r2Client = new S3Client({
  region: 'auto',
  endpoint: `https://${process.env.CLOUDFLARE_ACCOUNT_ID}.r2.cloudflarestorage.com`,
  credentials: {
    accessKeyId: process.env.R2_ACCESS_KEY_ID!,
    secretAccessKey: process.env.R2_SECRET_ACCESS_KEY!,
  },
});

export const BUCKET_NAME = 'pinkbeam-files';
```

### File Size Limits
```typescript
const FILE_LIMITS = {
  maxSize: 100 * 1024 * 1024, // 100MB
  allowedTypes: [
    'image/*',
    'application/pdf',
    'application/zip',
    'text/*',
    'application/vnd.*' // Office docs
  ]
};
```

---

*Never expose R2 credentials to client — always use presigned URLs*
