-- Crescendo cloud foundation

create table if not exists public.learners (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.practice_sessions (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid not null references public.learners(id) on delete cascade,
  started_at timestamptz not null default now(),
  duration_seconds integer,
  focus_area text,
  source text,
  summary jsonb not null default '{}'::jsonb
);

create table if not exists public.assessments (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid not null references public.learners(id) on delete cascade,
  assessment_type text not null,
  score numeric,
  max_score numeric,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.compositions (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid not null references public.learners(id) on delete cascade,
  title text not null,
  mission_id text,
  notes jsonb not null default '[]'::jsonb,
  tempo integer,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid not null references public.learners(id) on delete cascade,
  project_type text not null,
  title text not null,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.achievements (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid not null references public.learners(id) on delete cascade,
  achievement_key text not null,
  metadata jsonb not null default '{}'::jsonb,
  earned_at timestamptz not null default now(),
  unique (learner_id, achievement_key)
);

alter table public.learners enable row level security;
alter table public.practice_sessions enable row level security;
alter table public.assessments enable row level security;
alter table public.compositions enable row level security;
alter table public.projects enable row level security;
alter table public.achievements enable row level security;

create policy "learner owns profile"
on public.learners
for all to authenticated
using (auth.uid() = id)
with check (auth.uid() = id);

create policy "learner owns practice"
on public.practice_sessions
for all to authenticated
using (auth.uid() = learner_id)
with check (auth.uid() = learner_id);

create policy "learner owns assessments"
on public.assessments
for all to authenticated
using (auth.uid() = learner_id)
with check (auth.uid() = learner_id);

create policy "learner owns compositions"
on public.compositions
for all to authenticated
using (auth.uid() = learner_id)
with check (auth.uid() = learner_id);

create policy "learner owns projects"
on public.projects
for all to authenticated
using (auth.uid() = learner_id)
with check (auth.uid() = learner_id);

create policy "learner owns achievements"
on public.achievements
for all to authenticated
using (auth.uid() = learner_id)
with check (auth.uid() = learner_id);
