# Wanderlust Vietnam — reconstructed iPhone practice test

**Status:** Original practice paper, not the official exam. It combines evidence from the supplied 2025B Wanderlust solution with the professor's final lecture transcript. The solution is incomplete, so the missing requirements and the fifth screen below are deliberate practice assumptions.

**Time:** 120 minutes. **Platform:** iPhone, SwiftUI. **Goal:** Build an app that visually matches the five screen specifications and passes the interaction checks. Use the supplied Wanderlust images, font, colours, icon, and JSON as starter assets. Work from this paper without using the old Swift source files.

## What the source material actually establishes

| Evidence | What it supports | Certainty |
|---|---|---|
| [Final lecture transcript](</Users/vantai/Downloads/[Weekly Online Lecture] COSC3062_COSC3063 - iPhone Software Engineering.vtt>) at 20:05–22:22 | A roughly two-hour, one-app exam with four or five simple views, screenshots, starter assets, component/layout/colour requirements, navigation, animation, dark mode, and a SwiftData question | Explicit lecture guidance, but not a released paper for this year |
| Transcript at 04:35–05:44 | Organise model, view model, and view; use an observation approach; SwiftData may be assessed; Core Data and Firebase will not be asked | Explicit guidance in that lecture |
| Transcript at 09:58–10:29 | A map with markers was being considered; the lecturer said the final exam was still being drafted | Possible, not guaranteed |
| [Wanderlust source folder](</Users/vantai/Downloads/Wanderlust Vietnam/>) | Welcome, destination list, detail, and settings layouts; four bundled destinations; colour and image names | Directly visible in the solution, but not proof of the original question wording |
| This mock paper's Saved screen and bookmark control | A concrete way to practise the SwiftData requirement | Invented for practice |

The old project labels itself **Assignment 3**, and it has gaps: its settings sheet is commented out, the welcome link has no enclosing navigation container, and its tap gesture has a likely invalid closure parameter. Those are signs that it is a student's partial submission. Do not treat its code or comments as instructions or as a complete specification of the teacher's app.

### Lecture analysis: what to revise

The timestamps refer to the supplied `.vtt` transcript. It is an automatic transcript, so some terms are mistranscribed (for example, “stay” appears to mean `@State`, and “code data” means Core Data). The following uses the surrounding context rather than treating those words literally.

| Topic | Lecture cue | Exam implication |
|---|---|---|
| SwiftUI layout, images, SF Symbols, state, conditionals, switching views | 01:23–02:47; 07:11–07:45 | Basic ability expected. Practise `VStack`, `HStack`, `ZStack`, `Spacer`, `Image`, `Text`, buttons, and `@State` driven screen changes. |
| Navigation, lists, reusable subviews, shapes, map markers | 08:03–10:29 | Navigation and list layouts are likely. The lecturer specifically calls out circular image clipping as useful and mentions a minimum map-with-markers skill, while also saying the final paper was still being drafted. |
| Bundled JSON and `Codable`; bindings | 10:33–12:04 | Practise decoding a supplied JSON file and passing state between views. |
| Forms, sections, sheets, persistent small preferences, animations | 12:45–15:12 | Suitable for a settings sheet and dark-mode toggle. The lecture says side effects will not be asked. |
| Data flow and MVVM/observation | 15:12–18:08 | The lecturer explicitly expects model/view model/view organisation and an observation framework. Know which view owns mutable state and when a binding is passed. |
| SwiftData | 18:25–19:37; 22:16–22:22 | A SwiftData question is explicitly anticipated. Practise local create/read/delete and persistence. |
| Exclusions | 03:13–03:48; 05:31–05:46; 13:26–13:31 | Accessibility testing, Core Data, Firebase, and haptic feedback are explicitly ruled out or said to be untestable in that lecture. The lecture does not clearly rule out all sound tasks. |

The lecturer described **that exam** as open book, with generative AI prohibited and predictive code to be disabled (05:52–06:16); questions covered weeks **3–11** rather than asking standalone weeks 1–2 questions (06:31–06:41). The session was scheduled for **12:30–2:30**, and screen recording was required (06:20–06:25; 23:08–23:19). These are historical statements from the supplied lecture, **not verified rules for your upcoming sitting**. Check the current course announcement for this year's rules.

## Supplied resources for this mock

Start a fresh Xcode iOS app named **Wanderlust Vietnam**. Copy only the resources below from the supplied folder into the new project. Use a recent iPhone simulator. The old project targets iOS 18.5, but the practice requirements do not depend on that exact version.

- `Assets.xcassets` images: `icon`; `halong-1...3`; `hoian-1...3`; `phongnha-1...3`; `hanoi-1...3`. Each destination image set has 1×, 2× and 3× variants.
- `Sacramento-Regular.ttf` for the author lines. Register it in the app target if needed.
- `destinations.json`, with four records in this order: Ha Long Bay, Hoi An Ancient Town, Phong Nha Cave, Hoan Kiem Lake. The expected keys are `id`, `name`, `province`, `headline`, `description`, `imageName`, and `galleryImages`.
- App icon: use the supplied icon assets.

### Colour tokens

Create named colours in the asset catalog. The RGB values come from the supplied project.

| Token | Light | Dark | Use |
|---|---|---|---|
| `BrandPrimary` | `#922B21` | `#E74C3C` | Main heading, key buttons, navigation controls |
| `BrandSecondary` | `#1F4E79` | `#5DADE2` | Supporting text |
| `BackgroundColor` | `#D5DBDB` | `#1C2833` | Main screen backgrounds |

Use dynamic system text and grouped-form colours where appropriate. The old list hard-codes white; this mock requires it to adapt to dark mode so that the toggle has a visible effect throughout the app. That change is an intentional practice requirement.

## App behaviour and data

1. Decode the bundled JSON into a `Destination` model. Preserve file order. Show a useful fallback message if loading fails; the app must not crash.
2. Put data loading, the selected list filter, and save/unsave operations behind a view model. Keep model, view model, and view files in separate folders. Use either `@Observable` or the property-wrapper observation pattern taught in class; use one approach consistently.
3. Use a navigation container that makes every screen reachable. All back, Done, and Close controls must work.
4. Persist the dark-mode preference with `@AppStorage`. Relaunching the app must keep the user's choice.
5. Persist saved destination IDs with **SwiftData**, using one record per destination ID. A user can save or unsave a destination from its detail screen. Saved destinations remain saved after relaunch. Do not duplicate records when the button is tapped repeatedly.
6. Make the welcome logo react to a tap with a visible rotation animation. The app still lets the user enter the list normally.

The four JSON destinations are read-only catalog data. SwiftData stores only the user's saved IDs. This split is a mock design choice to exercise both bundled JSON and local persistence.

## Screen 1 — Welcome

**Visual target, portrait iPhone:** A calm, vertically centered column on `BackgroundColor`. No tab bar. Keep generous empty space above and below the content.

```text
┌─────────────────────────────────────┐
│                                     │
│                                     │
│          [ 200 × 200 logo ]         │
│                                     │
│        Wanderlust Vietnam           │
│          Your Name                  │
│          Your Student ID            │
│                                     │
│      [ Explore Destination ]        │
│                                     │
│                                     │
└─────────────────────────────────────┘
```

- Logo: the supplied `icon` image, approximately **200 × 200 points**, aspect-fit. A tap rotates it through a full turn with an ease-in-out animation. The exact duration is flexible; it should be visible and settle back to its original orientation.
- Title: **“Wanderlust Vietnam”**, bold system font around **40 pt**, `BrandPrimary`, centred. On a narrow iPhone, allow sensible line wrapping rather than clipping.
- Two lines under the title: replace the old student's name and ID with **your own** name and ID. Use Sacramento at about **35 pt**, `BrandSecondary`, centred. If the font fails to load, use a legible fallback.
- Primary action: a rounded rectangle around the **“Explore Destination”** label, white or background-coloured text on `BrandPrimary`, about **10 pt** corner radius, comfortable padding. Tapping it opens Screen 2.
- Spacing: about 12–20 pt between major elements; the author and ID lines can be closer together.

**Check:** the logo animation does not navigate; the button does. Back navigation from Screen 2 returns here.

## Screen 2 — Destinations

**Visual target:** A native navigation bar with large title **“Destinations”**. The main area is a vertical list of four clean rows on the current background colour. The original solution uses a scrolling stack with no visible separators or card shadows. Use about **8 pt** screen inset and **6 pt** vertical space around each row.

```text
┌─────────────────────────────────────┐
│ Destinations               ♡    ⚙︎  │
├─────────────────────────────────────┤
│ [Ha Long]  Ha Long Bay               │
│            A breathtaking seascape…  │
│                                     │
│ [Hoi An]  Hoi An Ancient Town        │
│            A well-preserved example… │
│                                     │
│ [Cave]    Phong Nha Cave             │
│            Home to the world's…      │
│                                     │
│ [Lake]    Hoan Kiem Lake             │
│            The historical and…       │
└─────────────────────────────────────┘
```

- Row image: corresponding `imageName`, roughly **80 × 80 pt**, cropped or fitted without distortion, with about **25 pt** corner radius.
- Text column: destination name in bold system font around **24 pt**, `BrandPrimary`; headline below in **16 pt**, `BrandSecondary`. Allow the headline to wrap to two or three lines. Align the column's leading edge consistently, about **10 pt** after the image.
- Row interaction: tap anywhere on a row to open that destination's Screen 3. Keep each row's height large enough to avoid text overlapping the next row.
- Toolbar: a **gear** button opens Screen 5 as a sheet. A **heart/bookmark** button opens Screen 4. The heart/bookmark is an added practice control; its icon and placement are this mock's choice.
- Empty/error state: if the JSON cannot be decoded, show a short message such as “Destinations could not be loaded” in the list area.

**Check:** all four rows appear in JSON order; every row opens the matching image, name, province, description, and gallery.

## Screen 3 — Destination detail

**Visual target:** A full-width hero photo under a compact navigation bar. Below it is a left-aligned title, province, thin divider, paragraph, and a horizontal strip of three small photos. The entire content scrolls vertically.

```text
┌─────────────────────────────────────┐
│ ‹ Destination       Ha Long Bay   ♡  │
├─────────────────────────────────────┤
│                                     │
│       full-width hero image         │
│          about 400 pt high          │
│                                     │
├─────────────────────────────────────┤
│ Ha Long Bay                         │
│   Quang Ninh                        │
│ ─────────────────────────────────── │
│ The destination description wraps   │
│ across multiple lines…              │
│                                     │
│ [photo 1] [photo 2] [photo 3] →     │
└─────────────────────────────────────┘
```

- Navigation bar: centred destination name in bold. Leading control shows a chevron and **“Destination”**, coloured `BrandPrimary`, and returns to Screen 2 or Screen 4 depending on where the user came from. Trailing **heart/bookmark** button reflects saved state.
- Hero: `imageName`, full width, about **400 pt** high, aspect-fill and clipped. Do not stretch the photo.
- Name: native `.title` scale, bold, `BrandPrimary`, about **10 pt** padding around it. Province: caption-size, medium weight, `BrandSecondary`, with about **20 pt** horizontal inset.
- Divider: thin full-width line. Paragraph: the full JSON `description`, body-size text, about **20 pt** side padding. Let it wrap naturally.
- Gallery: horizontal scroll with the three `galleryImages` in JSON order. Each tile is approximately **120 × 120 pt**, rounded **15 pt**, and separated by about **8–12 pt**. Keep the strip about **20 pt** from the screen edges.
- Background: `BackgroundColor`. All text remains readable in dark mode.
- Save action: tap the heart to add/remove that destination from SwiftData; its filled/outline appearance updates immediately. This control is invented for the mock because the old project contains no SwiftData feature.

**Check:** save Ha Long Bay, navigate back, open it again, and see the filled state; remove it and see the outline state.

## Screen 4 — Saved destinations (mock extension)

This fifth screen is **not present in the old student solution**. It is an original practice screen to make the lecture's SwiftData topic concrete.

**Visual target:** Navigation title **“Saved”**, same background and row style as Screen 2. A native Back button returns to Screen 2. No new image assets are needed.

```text
┌─────────────────────────────────────┐
│ ‹ Destinations       Saved           │
├─────────────────────────────────────┤
│ [Ha Long]  Ha Long Bay               │
│            A breathtaking seascape…  │
│                                     │
│ or, when nothing is saved:           │
│        No saved destinations         │
└─────────────────────────────────────┘
```

- Show only catalog destinations whose IDs exist in SwiftData, in the same order as the JSON.
- Tapping a row opens Screen 3. Unsave there, return, and the row disappears immediately.
- Empty state: centred **“No saved destinations”**, with optional `heart` symbol in `BrandSecondary`.
- Relaunch test: save two items, force-close, relaunch, and confirm both remain in Saved.

## Screen 5 — Settings sheet

**Visual target:** Native modal sheet with a compact navigation bar titled **“Settings”** and a **“Done”** button at top right. Inside, use a grouped Form.

```text
┌─────────────────────────────────────┐
│               Settings       Done    │
├─────────────────────────────────────┤
│ APPEARANCE                          │
│ ┌─────────────────────────────────┐ │
│ │ Dark Mode                 [ ○ ] │ │
│ └─────────────────────────────────┘ │
│                                     │
└─────────────────────────────────────┘
```

- Section header: **“Appearance”**. One row: **“Dark Mode”** with a native switch.
- Switching on immediately changes the sheet and all main screens to dark appearance. Switching off restores light appearance.
- `Done` dismisses the sheet. Dismissal and relaunch do not reset the stored choice.

## Marking checklist for self-review — 100 practice points

These weights are **invented for practice**, not the university rubric.

| Area | Points | Pass condition |
|---|---:|---|
| Welcome screen | 12 | Correct layout, personal lines, logo animation, working Explore button |
| JSON and model/view model structure | 12 | Four records decode, errors handled, model/view model/view separation, observation updates UI |
| Destination list | 18 | Correct order, images, typography, layout, navigation, toolbar |
| Detail screen | 20 | Matching data, hero, province, description, gallery, back navigation |
| SwiftData saved flow | 18 | Save/unsave, Saved screen, immediate UI update, persistence after relaunch |
| Settings | 12 | Sheet, Done, stored dark mode, readable adaptive screens |
| Assets and finish | 8 | Named colours, custom font, icon, no clipping, runs on simulator |

**Suggested 120-minute practice schedule:** 0–10 min create project/import assets; 10–25 min model, JSON, view model; 25–40 min Welcome; 40–65 min list; 65–85 min detail; 85–105 min SwiftData and Saved; 105–115 min Settings; 115–120 min simulator checks. If short on time, finish the screen flows before visual polish.

## Final simulator walk-through

1. Launch in light mode. Welcome shows logo, correct title, your details, and Explore button.
2. Tap logo: see a full rotation without changing screens. Tap Explore: see exactly four destinations.
3. Open **Hoi An Ancient Town**: verify `hoian-1` hero, **Quang Nam**, its full paragraph, and `hoian-1/2/3` gallery images.
4. Return. Save Hoi An in detail, then open Saved and find it. Remove it in detail and see Saved become empty.
5. Save **Ha Long Bay** and **Phong Nha Cave**. Relaunch; both are still in Saved.
6. Open Settings, turn Dark Mode on, tap Done, navigate through Welcome/list/detail/Saved, relaunch, and confirm the choice persists.

## Optional stretch task: map and markers

The lecturer discussed maps at 09:58–10:29 but said the actual paper was still being drafted. For separate practice, add a **“Map”** button to the list toolbar and show a map with markers for all four destinations. The source JSON has **no coordinates**, so add a small separate coordinate fixture yourself. Tapping a marker should show the destination name and open its detail. Treat this as an extra exercise, not a claimed requirement of the historical Wanderlust paper.

## Notes on likely versus unknown exam content

- The lecture explicitly names SwiftUI layout, navigation, animation, assets and fonts, JSON, observation/MVVM, dark mode, and SwiftData as relevant. It explicitly excludes Firebase and Core Data from that exam.
- The original Wanderlust solution strongly suggests welcome, list, detail, gallery, and settings views. It does not reveal the teacher's screenshots, exact spacing, exact font sizes, original rubric, or any unimplemented task. The values above are measured from the available source where possible and otherwise chosen as reasonable visual targets.
- The lecture says the real exam will provide screenshots for each view. This paper uses text diagrams and precise dimensions to simulate that experience; it cannot certify what this year's app will look like.
