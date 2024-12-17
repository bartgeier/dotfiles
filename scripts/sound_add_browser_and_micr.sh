#!/bin/bash

# Step 1: Create the SkypeSink for Skype
pactl load-module module-null-sink sink_name=SkypeSink sink_properties=device.description="SkypeSink"

# Step 2: Create the SpeakerSink for general audio
pactl load-module module-null-sink sink_name=SpeakerSink sink_properties=device.description="SpeakerSink"

# Step 3: Route SpeakerSink's audio (monitor) into SkypeSink
pactl load-module module-loopback source=SpeakerSink.monitor sink=SkypeSink latency_msec=50

# Step 4: Route Microphone into SkypeSink
pactl load-module module-loopback source=$(pactl get-default-source) sink=SkypeSink latency_msec=50

# Step 5: speakerSink on your speakers
pactl load-module module-loopback source=SpeakerSink.monitor sink=$(pactl get-default-sink) latency_msec=50
