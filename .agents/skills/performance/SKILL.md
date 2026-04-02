---
name: performance
description: Performance optimization patterns, caching strategies, and efficiency techniques.
---

# Performance Optimization

Patterns for building performant applications.

## JavaScript/TypeScript

### Avoid Unnecessary Work

```typescript
// GOOD: Memoize expensive calculations
const sortedItems = useMemo(() => {
  return items.sort((a, b) => b.score - a.score);
}, [items]);

// GOOD: Memoize callbacks
const handleSearch = useCallback((query: string) => {
  setResults(search(query));
}, []);

// GOOD: Lazy load
const HeavyComponent = lazy(() => import("./HeavyComponent"));
```

### Efficient Arrays

```typescript
// GOOD: Use map/filter early to reduce size
const activeNames = users
  .filter((u) => u.active)
  .map((u) => u.name);

// BAD: Filter then iterate
const activeNames = [];
for (const user of users) {
  if (user.active) activeNames.push(user.name);
}

// GOOD: Use Set for lookups
const userIds = new Set(users.map((u) => u.id));
const hasUser = userIds.has(targetId); // O(1)

// BAD: Array includes for lookups
const hasUser = users.some((u) => u.id === targetId); // O(n)
```

## API Performance

### Batch Requests

```typescript
// GOOD: Batch multiple requests
const [users, posts] = await Promise.all([
  fetchUsers(),
  fetchPosts(),
]);

// BAD: Sequential requests
const users = await fetchUsers();
const posts = await fetchPosts();
```

### Pagination

```typescript
// Always paginate large results
const PAGE_SIZE = 50;

async function getAllUsers() {
  const allUsers = [];
  let page = 0;
  
  while (true) {
    const batch = await db.user.findMany({
      take: PAGE_SIZE,
      skip: page * PAGE_SIZE,
    });
    
    if (batch.length === 0) break;
    allUsers.push(...batch);
    page++;
  }
  
  return allUsers;
}
```

## Caching

### In-Memory Cache

```typescript
const cache = new Map<string, { data: any; expiry: number }>();

async function getCached(key: string, fetcher: () => Promise<any>, ttl = 60000) {
  const cached = cache.get(key);
  
  if (cached && cached.expiry > Date.now()) {
    return cached.data;
  }
  
  const data = await fetcher();
  cache.set(key, { data, expiry: Date.now() + ttl });
  return data;
}
```

### Cache Invalidation

```typescript
// Invalidate on write
async function updateUser(id: string, data: Partial<User>) {
  await db.user.update({ where: { id }, data });
  cache.delete(`user:${id}`);
}

// Use cache tags
await redis.delByTag(`user:${id}`);
```

## Database Queries

### N+1 Problem

```typescript
// BAD: N+1 queries
const users = await db.user.findMany();
for (const user of users) {
  const posts = await db.post.findMany({ where: { userId: user.id } });
  user.posts = posts;
}

// GOOD: Single query with join
const users = await db.user.findMany({
  include: { posts: true },
});
```

### Indexes

```typescript
// Create indexes for frequently queried columns
// In migration:
await db.$executeRaw`
  CREATE INDEX idx_orders_user_id ON orders(user_id);
  CREATE INDEX idx_orders_status ON orders(status);
`;
```

## Frontend Performance

### Code Splitting

```typescript
// Lazy load routes
const Dashboard = lazy(() => import("./pages/Dashboard"));
const Settings = lazy(() => import("./pages/Settings"));

// Lazy load heavy components
const Chart = lazy(() => import("./components/Chart"));
```

### Virtualization

```typescript
// Only render visible items
import { useVirtualizer } from "@tanstack/react-virtual";

function VirtualList({ items }) {
  const parentRef = useRef(null);
  const virtualizer = useVirtualizer({
    count: items.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 50,
  });

  return (
    <div ref={parentRef} style={{ height: 400, overflow: "auto" }}>
      <div style={{ height: virtualizer.getTotalSize() }}>
        {virtualizer.getVirtualItems().map((item) => (
          <div key={item.key} style={{ position: "absolute", top: item.start }}>
            {items[item.index].name}
          </div>
        ))}
      </div>
    </div>
  );
}
```

## Monitoring

```typescript
// Add performance metrics
const start = performance.now();
await expensiveOperation();
const duration = performance.now() - start;

console.log(`Operation took ${duration}ms`);
```
