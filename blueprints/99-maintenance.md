# Maintenance Blueprint

## When to Update Blueprints

Update blueprints when changing:
- `project.yml` (targets, sources, settings)
- `Makefile` (commands, build configuration)
- Files under `Sources/` (new features, restructuring)
- Dependencies or external packages

## Required Updates

When making changes, **MUST** update:

1. **Relevant blueprint(s)** under `/blueprints`
   - Update specific sections that changed
   - Keep commands and file paths accurate
   - Maintain invariant lists

2. **Derived docs** under `/docs`
   - Mirror blueprint changes in plain English
   - Update commands and instructions
   - Keep human-readable format

## File Addition Process

### Adding Swift Files
1. Create file in appropriate `Sources/` subdirectory
2. No `project.yml` changes needed (auto-discovered)
3. Run `make gen` to regenerate project

### Adding New Directories
1. Create directory under `Sources/`
2. Add to `sources:` list in `project.yml`
3. Run `make gen` to regenerate project
4. Update relevant blueprints

### Adding Dependencies
1. Add to `project.yml` under target configuration
2. Run `make gen` to regenerate project
3. Update blueprints with new dependency info
4. Update docs with installation/usage instructions

## Blueprint Maintenance

- Keep blueprints **versionless** (avoid specific Xcode minor versions)
- Use **bullet points** for clarity
- Include **exact commands** and file paths
- Maintain **invariant lists** (YELLOW BOX sections)
- Keep **short and actionable**

## Agent Instructions

Cursor agents must:
- Read relevant blueprints before making changes
- Update both blueprints AND docs after changes
- Use exact commands from blueprints
- Maintain project structure invariants
- Never hand-edit `.xcodeproj`
