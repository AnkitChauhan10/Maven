package com.example.taskmanagementsystem.Reposiotry;

import com.example.taskmanagementsystem.Model.Task;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends MongoRepository<Task, String> {
    List<Task> findByCompletedFalse();
}
