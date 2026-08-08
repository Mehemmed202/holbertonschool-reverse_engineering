# Static Analysis & Reverse Engineering Fundamentals

> *"You cannot defend what you do not understand. Static analysis is the art of understanding a program without ever running it — and that changes everything."*

---

## Table of Contents
- [Overview](#overview)
- [Why Static Analysis Matters](#why-static-analysis-matters)
- [Resources](#resources)
- [Tools](#tools)
- [Learning Objectives](#learning-objectives)
- [Static Analysis Workflow](#static-analysis-workflow)

---

## Overview

In security investigations, every piece of malware, compiled exploit, or suspicious binary arrives simply as a file. **Static analysis** is the discipline of inspecting that file — its structure, strings, assembly code, and imported functions — to extract meaning before a single instruction executes.

By converting machine code into human-readable representations through disassembly and decompilation, static analysis allows analysts to audit, reverse engineer, and assess binaries safely and effectively.

---

## Why Static Analysis Matters

Static analysis is critical across three main scenarios:

1. **Malware Analysis:** Unknown binaries cannot be safely executed without prior assessment. Static analysis allows analysts to inspect malicious intent without risking infection.
2. **Security Auditing:** When source code is unavailable, static analysis enables auditors to verify binary behavior and uncover hidden vulnerabilities.
3. **CTF Challenges:** In binary exploitation and reverse engineering tasks, flags are embedded within compiled binaries. Finding them requires understanding the artifacts left behind by the compiler.

---

## Resources

### Reading & Watching List
* **Ghidra Beginner’s Guide / Reversing with Ghidra**
* **System Security Fundamentals**
* **Exponentiation by Squaring**
* **Modular Arithmetic**
* **Introduction to Cryptography**
* **Introduction to Assembly Language for Reverse Engineering**
* **GDB Tutorial: Stepping Through Assembly**
* **Understanding x86/x64 Assembly**

---

## Tools

| Tool | Category | Description |
| :--- | :--- | :--- |
| **Ghidra** | Decompiler / Disassembler | Open-source software reverse engineering (SRE) framework developed by the NSA. |
| **IDA Pro** | Decompiler / Disassembler | Industry-standard interactive disassembler and decompiler for software analysis. |
| **Radare2** | CLI Reverse Engineering | Advanced, highly customizable command-line framework for binary analysis. |
| **GDB** | Debugger | GNU Debugger used for stepping through execution and analyzing memory states. |
| **Objdump** | Binary Utility | Command-line tool for displaying detailed information and assembly code from object files. |

---

## Learning Objectives

Upon completing this module, you should be able to answer the following questions independently without external references:

1. **What is static analysis in reverse engineering?**  
   The process of examining a binary file's structure, code, and resources to understand its functionality without executing it.

2. **Why is static analysis important for malware analysis, security auditing, and software debugging?**  
   It mitigates execution risks for malware, enables code audits when source code is missing, and helps locate logical defects pre-execution.

3. **How do disassembly and decompilation aid in understanding a program's code?**  
   Disassembly converts raw machine code into readable assembly instructions (`MOV`, `JMP`, `PUSH`), while decompilation translates assembly into higher-level code (typically C-like syntax).

4. **What are the key differences between executable formats like PE (Windows), ELF (Linux), and Mach-O (macOS)?**  
   These formats differ in how operating systems parse and load binaries into memory, including their headers, entry points, sections (`.text`, `.data`, `.bss`), and dynamic linking mechanisms.

5. **What tools are commonly used for static analysis?**  
   Key tools include IDA Pro, Ghidra, Radare2, GDB, and Objdump.

6. **How do Control Flow Graphs (CFGs) assist in mapping out the execution flow of a program?**  
   CFGs visually map basic blocks of code alongside execution paths (branches, loops, function calls) to represent all possible execution routes.

7. **What techniques are used to identify vulnerabilities and bugs through pattern recognition and signature matching?**  
   Scanning for unsafe function calls (e.g., `strcpy`, `gets`), identifying known byte patterns, or matching YARA rules to detect vulnerabilities and malware families.

8. **How does header analysis contribute to understanding binary file structures?**  
   Headers contain essential metadata, including target architecture (x86/x64/ARM), section layouts, compilation timestamps, and imported/exported symbol tables.

9. **What role does cross-referencing (Xrefs) play in identifying critical functions and code paths?**  
   Xrefs allow analysts to trace where specific strings, variables, or functions are called or referenced throughout the binary.

10. **What are the steps in a typical static analysis workflow?**  
    See the section below.

---

## Static Analysis Workflow

```text
[1. Initial Inspection] ---> [2. Header & Imports] ---> [3. Disassembly & Decompilation] ---> [4. Code Analysis] ---> [5. Documentation]
