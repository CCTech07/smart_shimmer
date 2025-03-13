# smart_shimmer

A Flutter package that simplifies loading states by applying a shimmer effect directly to your
existing UI layout.

## Overview

`SmartShimmer` eliminates the need to create separate placeholder layouts for loading states. It
reuses your actual UI structure, applying a customizable shimmer effect when data is loading, and
seamlessly transitions to the loaded content when ready.

## Features

- Applies shimmer directly to your existing `child` widget.
- No duplicate layouts required—perfect design consistency.
- Smooth transition from loading to loaded state.
- Customizable shimmer properties (color, duration, etc.).
- Lightweight and efficient implementation.

## Installation

Add `smart_shimmer` to your `pubspec.yaml`:

```yaml
dependencies:
  smart_shimmer: ^1.0.0



bool isLoading = true;

// Simulate data fetching
Future.delayed(const Duration(seconds: 3), () {
  setState(() {
    isLoading = false;
  });
});

SmartShimmer(
  isLoading: isLoading,
  child: Column(
    children: [
      Container(
        width: 200,
        height: 50,
        color: Colors.blue,
        child: Center(
          child: Text(
            isLoading ? 'Loading...' : 'Data Loaded!',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(height: 20),
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
        ),
        title: Text(isLoading ? 'Fetching Name...' : 'John Doe'),
        subtitle: Text(isLoading ? 'Fetching Bio...' : 'Flutter Dev'),
      ),
    ],
  ),
)