
## [1.0.0] - 2025-03-13

### Initial Release

- **Added**: Introducing `SmartShimmer`, a Flutter package that simplifies loading states by applying a shimmer effect directly to your existing UI layout.
    - Core feature: Wraps any `child` widget and overlays a shimmer effect when `isLoading` is `true`, eliminating the need to duplicate layouts for placeholders.
    - Seamless integration: Reuses your actual UI structure for the shimmer, ensuring perfect design consistency.
    - Smooth transition: Fades out the shimmer to reveal the loaded content when `isLoading` becomes `false`.
- **Customization**:
    - `baseColor`: Sets the shimmer’s base color (default: `Colors.grey`).
    - `highlightColor`: Sets the shimmer’s highlight color (default: `Colors.white`).
    - `duration`: Controls the animation speed (default: `1500ms`).
- **Implementation**:
    - Uses `ShaderMask` with a `LinearGradient` for an efficient, lightweight shimmer effect.
    - Stacks the shimmer over a dimmed `child` widget during loading.

### Notes
- This is the first stable release, designed for ease of use and performance.
- Feedback and contributions are welcome!