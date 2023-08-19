import os

def create_directory_structure(root_dir):
    dirs = [
        'backup', 'bin', 'config', 'creds', 'dist', 'docs', 'enum',
        'examples', 'exploit', 'logs', 'plugins', 'root', 'sandbox',
        'temp', 'tests', 'web'
    ]
    
    for dir_name in dirs:
        os.makedirs(os.path.join(root_dir, dir_name), exist_ok=True)
        
    # Create subdirectories and files within creds
    os.makedirs(os.path.join(root_dir, 'creds', 'encrypted'), exist_ok=True)
    with open(os.path.join(root_dir, 'creds', 'encrypted', 'project1_credentials.enc'), 'w') as f:
        pass
    
    # Create subdirectories and files within dist
    os.makedirs(os.path.join(root_dir, 'dist', 'project1_releases', 'v1.0'), exist_ok=True)
    with open(os.path.join(root_dir, 'dist', 'project1_releases', 'v1.0', 'project1_v1.0.zip'), 'w') as f:
        pass
    with open(os.path.join(root_dir, 'dist', 'project1_releases', 'v1.0', 'release_notes.txt'), 'w') as f:
        pass
    
    # Create subdirectories and files within docs
    os.makedirs(os.path.join(root_dir, 'docs', 'project1', 'screenshots'), exist_ok=True)
    with open(os.path.join(root_dir, 'docs', 'project1', 'analysis_report.pdf'), 'w') as f:
        pass
    
    # Create subdirectories and files within logs
    os.makedirs(os.path.join(root_dir, 'logs', 'activity'), exist_ok=True)
    with open(os.path.join(root_dir, 'logs', 'activity', 'project1_activity.log'), 'w') as f:
        pass
    
    os.makedirs(os.path.join(root_dir, 'logs', 'error'), exist_ok=True)
    with open(os.path.join(root_dir, 'logs', 'error', 'project1_errors.log'), 'w') as f:
        pass
    
    # Create subdirectories and files within plugins
    with open(os.path.join(root_dir, 'plugins', 'plugin1.py'), 'w') as f:
        pass
    
    # Create subdirectories and files within root
    os.makedirs(os.path.join(root_dir, 'root', 'network_diagrams'), exist_ok=True)
    with open(os.path.join(root_dir, 'root', 'project_overview.txt'), 'w') as f:
        pass
    
    # Create subdirectories and files within sandbox
    os.makedirs(os.path.join(root_dir, 'sandbox', 'experimentation', 'iteration1'), exist_ok=True)
    with open(os.path.join(root_dir, 'sandbox', 'setup_instructions.txt'), 'w') as f:
        pass
    
    # Create subdirectories and files within tests
    os.makedirs(os.path.join(root_dir, 'tests', 'vulnerability'), exist_ok=True)
    with open(os.path.join(root_dir, 'tests', 'vulnerability', 'project1_vuln_test.py'), 'w') as f:
        pass
    
    os.makedirs(os.path.join(root_dir, 'tests', 'robustness'), exist_ok=True)
    with open(os.path.join(root_dir, 'tests', 'robustness', 'project1_stress_test.py'), 'w') as f:
        pass
    
    # Create subdirectories and files within web
    os.makedirs(os.path.join(root_dir, 'web', 'web_files', 'css'), exist_ok=True)
    with open(os.path.join(root_dir, 'web', 'index.html'), 'w') as f:
        pass

if __name__ == "__main__":
    project_root = "/home/user1/Documents/pentest_project"
    create_directory_structure(project_root)
    print("Directory structure and example files created successfully.")
