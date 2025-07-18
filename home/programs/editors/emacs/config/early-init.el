;; -*- lexical-binding: t -*-

(setq gc-cons-threshold 10000000)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(setq-default inhibit-splash-screen t)
